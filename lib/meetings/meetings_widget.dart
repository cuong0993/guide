import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authentication/authentication_controller.dart';
import '../require_login_page.dart';
import 'meeting_controller.dart';
import 'meeting_widget.dart';

class MeetingsWidget extends ConsumerWidget {
  const MeetingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authenticationProvider).when(
        loading: () => const Center(child: CircularProgressIndicator()),
        authenticated: () {
          final meetings = ref.watch(meetingProvider);
          return Scrollbar(
            child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels > 0 &&
                      notification.metrics.atEdge) {}
                  return true;
                },
                child: meetings.when(
                    data: (meetings) => ListView.builder(
                          itemCount: meetings.length,
                          itemBuilder: (context, index) {
                            final meeting = meetings[index];
                            return MeetingWidget(meeting: meeting);
                          },
                        ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (_, __) =>
                        const Center(child: CircularProgressIndicator()))),
          );
        },
        unauthenticated: () => const Center(child: RequireLoginWidget()));
  }
}
