// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_models_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentModelHash() => r'54f5d672e94a92d77a2b29ac1d2c99e430eb7fd8';

/// See also [CurrentModel].
@ProviderFor(CurrentModel)
final currentModelProvider = NotifierProvider<CurrentModel, String>.internal(
  CurrentModel.new,
  name: r'currentModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentModel = Notifier<String>;
String _$chatGptModelsHash() => r'a89c77ce987967879442a1b328caabf104fb1ec7';

/// See also [chatGptModels].
@ProviderFor(chatGptModels)
final chatGptModelsProvider = FutureProvider<ChatGptModelResult>.internal(
  chatGptModels,
  name: r'chatGptModelsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatGptModelsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatGptModelsRef = FutureProviderRef<ChatGptModelResult>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
