import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_color/random_color.dart';

/*
List<String> fakeServerMessages = [
  '안녕',
  '반가워',
  '여기는 서울 이야',
  '나는 쁘미라고 해',
  '아주 아주 반가워',
];

Stream<List<String>> streamMessage() async* {
  List<String> messages = <String>[];
  for (final message in fakeServerMessages) {
    await Future.delayed(Duration(seconds: 1));
    messages = [...messages, message];
    yield messages;
  }
}
*/

Future<void> dispatchMessage(StreamController controller) async {
  List<String> messages = <String>[];
  await Future.delayed(Duration(seconds: 1));
  messages.add('안녕 !!');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 2));
  messages.add('반가워 ^^');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 1));
  messages.add('나는 박기순 이야');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 1));
  messages.add('내 친구는 쁘미야');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 1));
  messages.add('우리 모두 행복 하자.');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 1));
  messages.add('러시아 우크라이나 전쟁이 끝나야 할텐데...');
  if (!controller.isClosed) controller.add(messages);

  await Future.delayed(Duration(seconds: 1));
  messages.add('GOOD BYE !!');
  if (!controller.isClosed) controller.add(messages);
}

final chatProvider = StreamProvider.autoDispose<List<String>>((ref) {
  final streamController = StreamController<List<String>>();
  dispatchMessage(streamController);

  ref.onDispose(
    () {
      streamController.close();
      print('chatProvider onDispose');
    },
  );
  return streamController.stream;
});

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(chatProvider);
    return Scaffold(
      appBar: AppBar(title: Text('chat (StreamProvider)')),
      body: Center(
        child: chat.when(
          data: (messages) {
            return SizedBox(
              width: 500,
              height: 300,
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  RandomColor _randomColor = RandomColor();
                  Color _color = _randomColor.randomColor();

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: _color),
                    ),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
