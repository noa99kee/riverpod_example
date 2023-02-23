import 'package:freezed_annotation/freezed_annotation.dart';

import 'permission.dart';

part 'chat_gpt_model.freezed.dart';
part 'chat_gpt_model.g.dart';

@freezed
class ChatGptModel with _$ChatGptModel {
	factory ChatGptModel({
		String? id,
		String? object,
		int? created,
		@JsonKey(name: 'owned_by') String? ownedBy,
		List<Permission>? permission,
		String? root,
		dynamic parent,
	}) = _ChatGptModel;

	factory ChatGptModel.fromJson(Map<String, dynamic> json) => _$ChatGptModelFromJson(json);
}