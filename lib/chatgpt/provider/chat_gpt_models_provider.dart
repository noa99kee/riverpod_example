import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/chatgpt/model/chat_gpt_model/chat_gpt_model_result.dart';
import 'package:riverpod_examples/chatgpt/repository/chat_gpt_repository.dart';

part 'chat_gpt_models_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ChatGptModelResult> chatGptModels(ChatGptModelsRef ref) async {
  final repository = ref.watch(chatGptRepositoryProvider);
  final modelsResult = await repository.getModels();

  return modelsResult;
}

@Riverpod(keepAlive: true)
class CurrentModel extends _$CurrentModel {
  @override
  String build() {
    return 'text-davinci-003';
  }

  void setModel({required String model}) {
    state = model;
  }
}
