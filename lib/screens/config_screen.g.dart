// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map<String, dynamic> json) => _$_Config(
      now_playing: json['now_playing'] as String,
      movie: json['movie'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'now_playing': instance.now_playing,
      'movie': instance.movie,
      'image': instance.image,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configHash() => r'8f8303fb42708f3b395950e911608aa76e355c28';

/// See also [config].
@ProviderFor(config)
final configProvider = AutoDisposeFutureProvider<Config>.internal(
  config,
  name: r'configProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$configHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfigRef = AutoDisposeFutureProviderRef<Config>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
