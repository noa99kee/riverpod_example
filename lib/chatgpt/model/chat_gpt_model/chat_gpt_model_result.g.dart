// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_model_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatGptModelResult _$$_ChatGptModelResultFromJson(
        Map<String, dynamic> json) =>
    _$_ChatGptModelResult(
      object: json['object'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatGptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatGptModelResultToJson(
        _$_ChatGptModelResult instance) =>
    <String, dynamic>{
      'object': instance.object,
      'data': instance.data,
    };
