// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGptModel _$ChatGptModelFromJson(Map<String, dynamic> json) {
  return _ChatGptModel.fromJson(json);
}

/// @nodoc
mixin _$ChatGptModel {
  String? get id => throw _privateConstructorUsedError;
  String? get object => throw _privateConstructorUsedError;
  int? get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'owned_by')
  String? get ownedBy => throw _privateConstructorUsedError;
  List<Permission>? get permission => throw _privateConstructorUsedError;
  String? get root => throw _privateConstructorUsedError;
  dynamic get parent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptModelCopyWith<ChatGptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptModelCopyWith<$Res> {
  factory $ChatGptModelCopyWith(
          ChatGptModel value, $Res Function(ChatGptModel) then) =
      _$ChatGptModelCopyWithImpl<$Res, ChatGptModel>;
  @useResult
  $Res call(
      {String? id,
      String? object,
      int? created,
      @JsonKey(name: 'owned_by') String? ownedBy,
      List<Permission>? permission,
      String? root,
      dynamic parent});
}

/// @nodoc
class _$ChatGptModelCopyWithImpl<$Res, $Val extends ChatGptModel>
    implements $ChatGptModelCopyWith<$Res> {
  _$ChatGptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? object = freezed,
    Object? created = freezed,
    Object? ownedBy = freezed,
    Object? permission = freezed,
    Object? root = freezed,
    Object? parent = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      ownedBy: freezed == ownedBy
          ? _value.ownedBy
          : ownedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as List<Permission>?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatGptModelCopyWith<$Res>
    implements $ChatGptModelCopyWith<$Res> {
  factory _$$_ChatGptModelCopyWith(
          _$_ChatGptModel value, $Res Function(_$_ChatGptModel) then) =
      __$$_ChatGptModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? object,
      int? created,
      @JsonKey(name: 'owned_by') String? ownedBy,
      List<Permission>? permission,
      String? root,
      dynamic parent});
}

/// @nodoc
class __$$_ChatGptModelCopyWithImpl<$Res>
    extends _$ChatGptModelCopyWithImpl<$Res, _$_ChatGptModel>
    implements _$$_ChatGptModelCopyWith<$Res> {
  __$$_ChatGptModelCopyWithImpl(
      _$_ChatGptModel _value, $Res Function(_$_ChatGptModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? object = freezed,
    Object? created = freezed,
    Object? ownedBy = freezed,
    Object? permission = freezed,
    Object? root = freezed,
    Object? parent = freezed,
  }) {
    return _then(_$_ChatGptModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      ownedBy: freezed == ownedBy
          ? _value.ownedBy
          : ownedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      permission: freezed == permission
          ? _value._permission
          : permission // ignore: cast_nullable_to_non_nullable
              as List<Permission>?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatGptModel implements _ChatGptModel {
  _$_ChatGptModel(
      {this.id,
      this.object,
      this.created,
      @JsonKey(name: 'owned_by') this.ownedBy,
      final List<Permission>? permission,
      this.root,
      this.parent})
      : _permission = permission;

  factory _$_ChatGptModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGptModelFromJson(json);

  @override
  final String? id;
  @override
  final String? object;
  @override
  final int? created;
  @override
  @JsonKey(name: 'owned_by')
  final String? ownedBy;
  final List<Permission>? _permission;
  @override
  List<Permission>? get permission {
    final value = _permission;
    if (value == null) return null;
    if (_permission is EqualUnmodifiableListView) return _permission;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? root;
  @override
  final dynamic parent;

  @override
  String toString() {
    return 'ChatGptModel(id: $id, object: $object, created: $created, ownedBy: $ownedBy, permission: $permission, root: $root, parent: $parent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGptModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.ownedBy, ownedBy) || other.ownedBy == ownedBy) &&
            const DeepCollectionEquality()
                .equals(other._permission, _permission) &&
            (identical(other.root, root) || other.root == root) &&
            const DeepCollectionEquality().equals(other.parent, parent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      object,
      created,
      ownedBy,
      const DeepCollectionEquality().hash(_permission),
      root,
      const DeepCollectionEquality().hash(parent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGptModelCopyWith<_$_ChatGptModel> get copyWith =>
      __$$_ChatGptModelCopyWithImpl<_$_ChatGptModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGptModelToJson(
      this,
    );
  }
}

abstract class _ChatGptModel implements ChatGptModel {
  factory _ChatGptModel(
      {final String? id,
      final String? object,
      final int? created,
      @JsonKey(name: 'owned_by') final String? ownedBy,
      final List<Permission>? permission,
      final String? root,
      final dynamic parent}) = _$_ChatGptModel;

  factory _ChatGptModel.fromJson(Map<String, dynamic> json) =
      _$_ChatGptModel.fromJson;

  @override
  String? get id;
  @override
  String? get object;
  @override
  int? get created;
  @override
  @JsonKey(name: 'owned_by')
  String? get ownedBy;
  @override
  List<Permission>? get permission;
  @override
  String? get root;
  @override
  dynamic get parent;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGptModelCopyWith<_$_ChatGptModel> get copyWith =>
      throw _privateConstructorUsedError;
}
