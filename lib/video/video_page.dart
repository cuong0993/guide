import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'video_controller.dart';

class VideoPage extends ConsumerWidget {
  final Map arguments;

  const VideoPage({Key? key, required this.arguments}) : super(key: key);

  List<Widget> _getRenderViews(VideoController controller) {
    final list = <StatefulWidget>[];
    if (controller.clientRole == ClientRole.Broadcaster) {
      list.add(rtc_local_view.SurfaceView());
    }
    for (final uid in controller.users) {
      list.add(rtc_remote_view.SurfaceView(uid: uid));
    }
    return list;
  }

  Widget _videoView(Widget view) {
    return Expanded(child: Container(child: view));
  }

  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  Widget _viewRows(VideoController controller) {
    final views = _getRenderViews(controller);
    switch (views.length) {
      case 1:
        return Column(
          children: <Widget>[_videoView(views[0])],
        );
      case 2:
        return Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        );
      case 4:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        );
      default:
    }
    return const SizedBox.shrink();
  }

  Widget _toolbar(BuildContext context, VideoController controller) {
    if (controller.clientRole == ClientRole.Audience) {
      return const SizedBox.shrink();
    }
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: controller.onToggleMute,
            shape: const CircleBorder(),
            elevation: 2,
            fillColor: controller.muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12),
            child: Icon(
              controller.muted ? Icons.mic_off : Icons.mic,
              color: controller.muted ? Colors.white : Colors.blueAccent,
              size: 20,
            ),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            shape: const CircleBorder(),
            elevation: 2,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35,
            ),
          ),
          RawMaterialButton(
            onPressed: controller.onSwitchCamera,
            shape: const CircleBorder(),
            elevation: 2,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _panel(VideoController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: controller.infoStrings.length,
            itemBuilder: (context, index) {
              if (controller.infoStrings.isEmpty) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          controller.infoStrings[index],
                          style: const TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoController = ref.watch(videoControllerProvider(arguments));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(videoController),
            _panel(videoController),
            _toolbar(context, videoController),
          ],
        ),
      ),
    );
  }
}
