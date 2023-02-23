import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage.freezed.dart';
part 'usage.g.dart';

@freezed
class Usage with _$Usage {
	factory Usage({
		@JsonKey(name: 'prompt_tokens') int? promptTokens,
		@JsonKey(name: 'completion_tokens') int? completionTokens,
		@JsonKey(name: 'total_tokens') int? totalTokens,
	}) = _Usage;

	factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}