// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageBody _$$_MessageBodyFromJson(Map<String, dynamic> json) =>
    _$_MessageBody(
      model: json['model'] as String?,
      prompt: json['prompt'] as String?,
      max_tokens: json['max_tokens'] as int? ?? 300,
    );

Map<String, dynamic> _$$_MessageBodyToJson(_$_MessageBody instance) =>
    <String, dynamic>{
      'model': instance.model,
      'prompt': instance.prompt,
      'max_tokens': instance.max_tokens,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ChatGptRepository implements ChatGptRepository {
  _ChatGptRepository(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChatGptModelResult> getModels() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer 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'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ChatGptModelResult>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/models',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChatGptModelResult.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Chat> getChat(messageBody) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer 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',
      r'Content-Type': 'application/json',
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(messageBody.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Chat>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
            .compose(
              _dio.options,
              '/completions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Chat.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatGptRepositoryHash() => r'ac4b26a3634fecdf093251aa9c39fee5f1219054';

/// See also [chatGptRepository].
@ProviderFor(chatGptRepository)
final chatGptRepositoryProvider = Provider<ChatGptRepository>.internal(
  chatGptRepository,
  name: r'chatGptRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatGptRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatGptRepositoryRef = ProviderRef<ChatGptRepository>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
