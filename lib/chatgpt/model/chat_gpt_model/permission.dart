import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class Permission with _$Permission {
	factory Permission({
		String? id,
		String? object,
		int? created,
		@JsonKey(name: 'allow_create_engine') bool? allowCreateEngine,
		@JsonKey(name: 'allow_sampling') bool? allowSampling,
		@JsonKey(name: 'allow_logprobs') bool? allowLogprobs,
		@JsonKey(name: 'allow_search_indices') bool? allowSearchIndices,
		@JsonKey(name: 'allow_view') bool? allowView,
		@JsonKey(name: 'allow_fine_tuning') bool? allowFineTuning,
		String? organization,
		dynamic group,
		@JsonKey(name: 'is_blocking') bool? isBlocking,
	}) = _Permission;

	factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
}