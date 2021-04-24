import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import 'meeting.dart';

class MeetingWidget extends StatelessWidget {
  final Meeting meeting;

  const MeetingWidget({Key? key, required this.meeting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: GestureDetector(
          onTap: () async {
            final dio = Dio();
            //TODO Environment variable
            final response = await dio.post<String>(
                'https://us-central1-${Firebase.app().options.projectId}.cloudfunctions.net/GetAgoraToken',
                data: {
                  'channelName': meeting.id,
                  'account': FirebaseAuth.instance.currentUser!.uid
                });
            await AutoRouter.of(context)
                .push(VideoRoute(arguments: <String, dynamic>{
              'channelName': meeting.id,
              'clientRole': ClientRole.Broadcaster,
              'token': response.data,
              'account': FirebaseAuth.instance.currentUser!.uid
            }));
          },
          child: Container(
            color: Theme.of(context).cardColor,
            child: Text(meeting.name),
          ),
        ));
  }
}
