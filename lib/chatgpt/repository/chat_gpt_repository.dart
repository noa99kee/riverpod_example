import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/chatgpt/model/chat/chat.dart';
import 'package:riverpod_examples/chatgpt/model/chat_gpt_model/chat_gpt_model_result.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:riverpod_examples/dio_provider.dart';

part 'chat_gpt_repository.g.dart';
part 'chat_gpt_repository.freezed.dart';

const String BASE_URL = "https://api.openai.com/v1";
const String API_KEY = "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";

@Riverpod(keepAlive: true)
ChatGptRepository chatGptRepository(ChatGptRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ChatGptRepository(dio, baseUrl: BASE_URL);
}

@RestApi()
abstract class ChatGptRepository {
  factory ChatGptRepository(Dio dio, {String baseUrl}) = _ChatGptRepository;

  @GET('/models')
  @Headers(<String, dynamic>{"Authorization": "Bearer $API_KEY"})
  Future<ChatGptModelResult> getModels();

  @POST('/completions')
  @Headers(<String, dynamic>{
    "Authorization": "Bearer $API_KEY",
    "Content-Type": "application/json"
  })
  Future<Chat> getChat(@Body() MessageBody messageBody);
}

@freezed
class MessageBody with _$MessageBody {
  factory MessageBody({
    String? model,
    String? prompt,
    @Default(300) int? max_tokens,
  }) = _MessageBody;

  factory MessageBody.fromJson(Map<String, dynamic> json) =>
      _$MessageBodyFromJson(json);
}
