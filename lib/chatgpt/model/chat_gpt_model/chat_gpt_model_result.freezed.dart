// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_model_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGptModelResult _$ChatGptModelResultFromJson(Map<String, dynamic> json) {
  return _ChatGptModelResult.fromJson(json);
}

/// @nodoc
mixin _$ChatGptModelResult {
  String? get object => throw _privateConstructorUsedError;
  List<ChatGptModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptModelResultCopyWith<ChatGptModelResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptModelResultCopyWith<$Res> {
  factory $ChatGptModelResultCopyWith(
          ChatGptModelResult value, $Res Function(ChatGptModelResult) then) =
      _$ChatGptModelResultCopyWithImpl<$Res, ChatGptModelResult>;
  @useResult
  $Res call({String? object, List<ChatGptModel>? data});
}

/// @nodoc
class _$ChatGptModelResultCopyWithImpl<$Res, $Val extends ChatGptModelResult>
    implements $ChatGptModelResultCopyWith<$Res> {
  _$ChatGptModelResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatGptModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatGptModelResultCopyWith<$Res>
    implements $ChatGptModelResultCopyWith<$Res> {
  factory _$$_ChatGptModelResultCopyWith(_$_ChatGptModelResult value,
          $Res Function(_$_ChatGptModelResult) then) =
      __$$_ChatGptModelResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? object, List<ChatGptModel>? data});
}

/// @nodoc
class __$$_ChatGptModelResultCopyWithImpl<$Res>
    extends _$ChatGptModelResultCopyWithImpl<$Res, _$_ChatGptModelResult>
    implements _$$_ChatGptModelResultCopyWith<$Res> {
  __$$_ChatGptModelResultCopyWithImpl(
      _$_ChatGptModelResult _value, $Res Function(_$_ChatGptModelResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ChatGptModelResult(
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatGptModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatGptModelResult implements _ChatGptModelResult {
  _$_ChatGptModelResult({this.object, final List<ChatGptModel>? data})
      : _data = data;

  factory _$_ChatGptModelResult.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGptModelResultFromJson(json);

  @override
  final String? object;
  final List<ChatGptModel>? _data;
  @override
  List<ChatGptModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatGptModelResult(object: $object, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGptModelResult &&
            (identical(other.object, object) || other.object == object) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, object, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGptModelResultCopyWith<_$_ChatGptModelResult> get copyWith =>
      __$$_ChatGptModelResultCopyWithImpl<_$_ChatGptModelResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGptModelResultToJson(
      this,
    );
  }
}

abstract class _ChatGptModelResult implements ChatGptModelResult {
  factory _ChatGptModelResult(
      {final String? object,
      final List<ChatGptModel>? data}) = _$_ChatGptModelResult;

  factory _ChatGptModelResult.fromJson(Map<String, dynamic> json) =
      _$_ChatGptModelResult.fromJson;

  @override
  String? get object;
  @override
  List<ChatGptModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGptModelResultCopyWith<_$_ChatGptModelResult> get copyWith =>
      throw _privateConstructorUsedError;
}
