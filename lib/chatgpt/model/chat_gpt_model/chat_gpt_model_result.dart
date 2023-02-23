import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_examples/chatgpt/model/chat_gpt_model/chat_gpt_model.dart';

part 'chat_gpt_model_result.freezed.dart';
part 'chat_gpt_model_result.g.dart';

@freezed
class ChatGptModelResult with _$ChatGptModelResult {
  factory ChatGptModelResult({
    String? object,
    List<ChatGptModel>? data,
  }) = _ChatGptModelResult;

  factory ChatGptModelResult.fromJson(Map<String, dynamic> json) =>
      _$ChatGptModelResultFromJson(json);
}
