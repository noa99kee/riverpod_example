// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatGptModel _$$_ChatGptModelFromJson(Map<String, dynamic> json) =>
    _$_ChatGptModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      ownedBy: json['owned_by'] as String?,
      permission: (json['permission'] as List<dynamic>?)
          ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
      root: json['root'] as String?,
      parent: json['parent'],
    );

Map<String, dynamic> _$$_ChatGptModelToJson(_$_ChatGptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'owned_by': instance.ownedBy,
      'permission': instance.permission,
      'root': instance.root,
      'parent': instance.parent,
    };
