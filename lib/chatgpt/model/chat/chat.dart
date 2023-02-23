import 'package:freezed_annotation/freezed_annotation.dart';

import 'choice.dart';
import 'usage.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
	factory Chat({
		String? id,
		String? object,
		int? created,
		String? model,
		List<Choice>? choices,
		Usage? usage,
	}) = _Chat;

	factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}