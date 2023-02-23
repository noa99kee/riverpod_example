// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_gpt_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageBody _$MessageBodyFromJson(Map<String, dynamic> json) {
  return _MessageBody.fromJson(json);
}

/// @nodoc
mixin _$MessageBody {
  String? get model => throw _privateConstructorUsedError;
  String? get prompt => throw _privateConstructorUsedError;
  int? get max_tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageBodyCopyWith<MessageBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageBodyCopyWith<$Res> {
  factory $MessageBodyCopyWith(
          MessageBody value, $Res Function(MessageBody) then) =
      _$MessageBodyCopyWithImpl<$Res, MessageBody>;
  @useResult
  $Res call({String? model, String? prompt, int? max_tokens});
}

/// @nodoc
class _$MessageBodyCopyWithImpl<$Res, $Val extends MessageBody>
    implements $MessageBodyCopyWith<$Res> {
  _$MessageBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? prompt = freezed,
    Object? max_tokens = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      max_tokens: freezed == max_tokens
          ? _value.max_tokens
          : max_tokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageBodyCopyWith<$Res>
    implements $MessageBodyCopyWith<$Res> {
  factory _$$_MessageBodyCopyWith(
          _$_MessageBody value, $Res Function(_$_MessageBody) then) =
      __$$_MessageBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? model, String? prompt, int? max_tokens});
}

/// @nodoc
class __$$_MessageBodyCopyWithImpl<$Res>
    extends _$MessageBodyCopyWithImpl<$Res, _$_MessageBody>
    implements _$$_MessageBodyCopyWith<$Res> {
  __$$_MessageBodyCopyWithImpl(
      _$_MessageBody _value, $Res Function(_$_MessageBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? prompt = freezed,
    Object? max_tokens = freezed,
  }) {
    return _then(_$_MessageBody(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      max_tokens: freezed == max_tokens
          ? _value.max_tokens
          : max_tokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageBody implements _MessageBody {
  _$_MessageBody({this.model, this.prompt, this.max_tokens = 300});

  factory _$_MessageBody.fromJson(Map<String, dynamic> json) =>
      _$$_MessageBodyFromJson(json);

  @override
  final String? model;
  @override
  final String? prompt;
  @override
  @JsonKey()
  final int? max_tokens;

  @override
  String toString() {
    return 'MessageBody(model: $model, prompt: $prompt, max_tokens: $max_tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageBody &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.max_tokens, max_tokens) ||
                other.max_tokens == max_tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, prompt, max_tokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageBodyCopyWith<_$_MessageBody> get copyWith =>
      __$$_MessageBodyCopyWithImpl<_$_MessageBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageBodyToJson(
      this,
    );
  }
}

abstract class _MessageBody implements MessageBody {
  factory _MessageBody(
      {final String? model,
      final String? prompt,
      final int? max_tokens}) = _$_MessageBody;

  factory _MessageBody.fromJson(Map<String, dynamic> json) =
      _$_MessageBody.fromJson;

  @override
  String? get model;
  @override
  String? get prompt;
  @override
  int? get max_tokens;
  @override
  @JsonKey(ignore: true)
  _$$_MessageBodyCopyWith<_$_MessageBody> get copyWith =>
      throw _privateConstructorUsedError;
}
