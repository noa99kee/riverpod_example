import 'package:freezed_annotation/freezed_annotation.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
class Choice with _$Choice {
	factory Choice({
		String? text,
		int? index,
		dynamic logprobs,
		@JsonKey(name: 'finish_reason') String? finishReason,
	}) = _Choice;

	factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}