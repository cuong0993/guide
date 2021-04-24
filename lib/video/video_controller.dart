import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

//TODO Environment variable
const appId = 'a3e38c9a92f34bac9aeca0b6f9976e4a';

final videoControllerProvider = ChangeNotifierProvider.autoDispose
    .family<VideoController, Map>((ref, arguments) {
  final channelName = arguments['channelName'] as String;
  final clientRole = arguments['clientRole'] as ClientRole;
  final token = arguments['token'] as String;
  final account = arguments['account'] as String;
  final controller = VideoController(channelName, clientRole, token, account)
    .._initialize();
  ref.onDispose(() {
    controller._dispose();
  });
  return controller;
});

class VideoController extends ChangeNotifier {
  final users = <int>[];
  final infoStrings = <String>[];
  bool muted = false;
  late RtcEngine _engine;
  final String _channelName;
  final ClientRole clientRole;
  final String _token;
  final String _account;

  VideoController(
      this._channelName, this.clientRole, this._token, this._account);

  Future<void> _initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    final configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(height: 1920, width: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera].request();
    }
    await _engine.joinChannelWithUserAccount(_token, _channelName, _account);
  }

  void _dispose() {
    users.clear();
    _engine.leaveChannel();
    _engine.destroy();
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.createWithContext(RtcEngineContext(appId));
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(clientRole);
  }

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      final info = 'onError: $code';
      infoStrings.add(info);
      notifyListeners();
    }, joinChannelSuccess: (channel, uid, elapsed) {
      final info = 'onJoinChannel: $channel, uid: $uid';
      infoStrings.add(info);
      notifyListeners();
    }, leaveChannel: (stats) {
      infoStrings.add('onLeaveChannel');
      users.clear();
      notifyListeners();
    }, userJoined: (uid, elapsed) {
      final info = 'userJoined: $uid';
      infoStrings.add(info);
      users.add(uid);
      notifyListeners();
    }, userOffline: (uid, elapsed) {
      final info = 'userOffline: $uid';
      infoStrings.add(info);
      users.remove(uid);
      notifyListeners();
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      final info = 'firstRemoteVideo: $uid ${width}x $height';
      infoStrings.add(info);
      notifyListeners();
    }));
  }

  void onToggleMute() {
    muted = !muted;
    _engine.muteLocalAudioStream(muted);
    notifyListeners();
  }

  void onSwitchCamera() {
    _engine.switchCamera();
  }
}
