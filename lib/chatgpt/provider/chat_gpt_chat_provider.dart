import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/chatgpt/model/chat/chat.dart';
import 'package:riverpod_examples/chatgpt/repository/chat_gpt_repository.dart';

part 'chat_gpt_chat_provider.g.dart';

//send message
@riverpod
Future<List<ChatModel>> chatGptChat(ChatGptChatRef ref,
    {required String model, required String message, int? max_tokens}) async {
  final repository = ref.watch(chatGptRepositoryProvider);
  MessageBody messageBody =
      MessageBody(model: model, prompt: message, max_tokens: max_tokens);

  final chat = await repository.getChat(messageBody);

  //chatgpt 주는것
  final chatModels = chat.choices!
      .map((choise) => ChatModel(msg: choise.text!, chatIndex: 1))
      .toList();

  ref.watch(chatModelsProvider.notifier).state = [
    ...ref.watch(chatModelsProvider.notifier).state,
    ...chatModels
  ];

  return chatModels;
}

final chatModelsProvider = StateProvider<List<ChatModel>>((ref) => []);

class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );
}
