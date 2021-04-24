import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'chips_input.dart';
import 'compose_post_controller.dart';
import 'tag_controller.dart';
import 'time_of_day_extension.dart';

class ComposePostPage extends ConsumerWidget {
  const ComposePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final composePostController = ref.watch(composePostControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask for help',
            style: Theme.of(context).appBarTheme.textTheme!.headline5),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(
                Icons.send_rounded,
              ),
              onPressed: () {
                ref.read(composePostControllerProvider).post();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: 1,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What\'s the problem?',
                    hintStyle: TextStyle(fontSize: 18)),
                onChanged: (text) {
                  ref.read(composePostControllerProvider).name(text);
                },
              ),
              Center(
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Describe it',
                      hintStyle: TextStyle(fontSize: 18)),
                  onChanged: (text) {
                    ref.read(composePostControllerProvider).write(text);
                  },
                ),
              ),
              const Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: composePostController.imageUrls.length,
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            child: Image.file(
                              File(composePostController.imageUrls[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              onTap: () {
                                composePostController.removeImage(index);
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              InkWell(
                focusColor: Colors.black,
                onTap: () {
                  composePostController.chooseImage(ImageSource.camera);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.attach_file_outlined,
                    ),
                    Text('Attach')
                  ],
                ),
              ),
              const Divider(),
              InkWell(
                focusColor: Colors.black,
                onTap: () {
                  final hours = <TimeOfDay>[];
                  var hour = const TimeOfDay(hour: 0, minute: 0);
                  while (hour.before(const TimeOfDay(hour: 24, minute: 0))) {
                    hours.add(hour);
                    hour = hour.add(minutes: 30);
                  }
                  showModalBottomSheet<List<TimeOfDay>>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    builder: (context) {
                      return HookBuilder(builder: (_) {
                        final selectedTimeOfDays = useState(
                            List<TimeOfDay>.from(
                                composePostController.timeSlots));
                        return FractionallySizedBox(
                            heightFactor: 0.95,
                            child: WillPopScope(
                              onWillPop: () {
                                selectedTimeOfDays.value
                                    .sort((a, b) => a.compare(b));
                                Navigator.pop(
                                    context, selectedTimeOfDays.value);
                                return Future.value(false);
                              },
                              child: Column(
                                children: [
                                  AppBar(title: const Text('Time')),
                                  Expanded(
                                    child: Scrollbar(
                                      isAlwaysShown: true,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: hours.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            title: Text(
                                                hours[index].format(context)),
                                            value: selectedTimeOfDays.value
                                                .contains(hours[index]),
                                            activeColor: Colors.pink,
                                            checkColor: Colors.white,
                                            onChanged: (isSelected) {
                                              final newTimes = [
                                                ...selectedTimeOfDays.value
                                              ];
                                              if (isSelected!) {
                                                newTimes.add(hours[index]);
                                              } else {
                                                newTimes.remove(hours[index]);
                                              }
                                              selectedTimeOfDays.value =
                                                  newTimes;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      });
                    },
                  ).then((times) {
                    if (times != null) {
                      ref
                          .read(composePostControllerProvider)
                          .selectTimeSlots(times);
                    }
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                    ),
                    composePostController.timeSlots.isNotEmpty
                        ? Expanded(
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 2,
                              children: composePostController.timeSlots
                                  .map((e) => Chip(
                                        label: Text(e.format(context)),
                                      ))
                                  .toList(),
                            ),
                          )
                        : const Text('Add times'),
                  ],
                ),
              ),
              const Divider(),
              InkWell(
                focusColor: Colors.black,
                onTap: () {
                  showModalBottomSheet<List<String>>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    builder: (context) {
                      return FractionallySizedBox(
                        heightFactor: 0.95,
                        child: SelectTagsWidget(
                          initialTags: composePostController.tags,
                        ),
                      );
                    },
                  ).then((tags) {
                    if (tags != null) {
                      ref.read(composePostControllerProvider).addTags(tags);
                    }
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.tag,
                    ),
                    composePostController.tags.isNotEmpty
                        ? Expanded(
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 2,
                              children: composePostController.tags
                                  .map((e) => Chip(
                                        label: Text(e),
                                      ))
                                  .toList(),
                            ),
                          )
                        : const Text('Add tags'),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectTagsWidget extends HookWidget {
  const SelectTagsWidget({Key? key, required this.initialTags})
      : super(key: key);
  final List<String> initialTags;

  @override
  Widget build(BuildContext context) {
    final tags = useState(<String>[...initialTags]);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, tags.value);
        return Future.value(false);
      },
      child: Column(
        children: [
          AppBar(title: const Text('Tags')),
          Consumer(builder: (context, ref, child) {
            final tagNames = ref.watch(tagProvider).when(
                data: (tags) {
                  return tags.map((e) => e.name);
                },
                loading: () => <String>[],
                error: (_, __) => <String>[]);
            return ChipsInput<String>(
              initial: initialTags,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search tags'),
              findSuggestions: (_) async {
                return tagNames.toList();
              },
              onChanged: (data) {
                tags.value = data;
              },
              chipBuilder: (context, state, data) {
                return InputChip(
                  label: Text(data),
                  onDeleted: () => state.deleteChip(data),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              },
              suggestionBuilder: (context, state, data) {
                return ListTile(
                  title: Text(data),
                  onTap: () => state.selectSuggestion(data),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
