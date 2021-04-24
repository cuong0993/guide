import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../post/post.dart';
import 'schedule_meeting_controller.dart';

class ScheduleMeetingPage extends HookConsumerWidget {
  const ScheduleMeetingPage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = useState<DateTime?>(null);
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.schedule,
              style: Theme.of(context).appBarTheme.textTheme!.headline5),
          actions: [
            Consumer(builder: (context, ref, child) {
              if (selectedTime.value != null) {
                return TextButton(
                  onPressed: () async {
                    await ref
                        .read(scheduleMeetingControllerProvider(post))
                        .scheduleMeeting(selectedTime.value!);
                  },
                  child: Text(L10n.of(context)!.invite),
                );
              } else {
                return TextButton(
                  onPressed: () {},
                  child: Text(L10n.of(context)!.invite),
                );
              }
            })
          ],
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
            itemCount: post.timeSlots.length,
            itemBuilder: (context, index) {
              return RadioListTile<DateTime>(
                title: Text(
                    TimeOfDay.fromDateTime(post.timeSlots[index])
                        .format(context)
                        .toString(),
                    style: Theme.of(context).textTheme.headline6),
                value: post.timeSlots[index],
                groupValue: selectedTime.value,
                onChanged: (value) {
                  selectedTime.value = value;
                },
              );
            },
          ),
        ));
  }
}
