// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newChatModelHash() => r'ce0b72a110e8bf264109ae3b99270d380561e813';

/// See also [NewChatModel].
@ProviderFor(NewChatModel)
final newChatModelProvider =
    AutoDisposeAsyncNotifierProvider<NewChatModel, List<ChatModel>>.internal(
  NewChatModel.new,
  name: r'newChatModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newChatModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewChatModel = AutoDisposeAsyncNotifier<List<ChatModel>>;
String _$chatGptChatHash() => r'e33646b1afd18fe8d0fe2285bfd7a66507b814bf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ChatGptChatRef = AutoDisposeFutureProviderRef<List<ChatModel>>;

/// See also [chatGptChat].
@ProviderFor(chatGptChat)
const chatGptChatProvider = ChatGptChatFamily();

/// See also [chatGptChat].
class ChatGptChatFamily extends Family<AsyncValue<List<ChatModel>>> {
  /// See also [chatGptChat].
  const ChatGptChatFamily();

  /// See also [chatGptChat].
  ChatGptChatProvider call({
    required String model,
    required String message,
    int? max_tokens,
  }) {
    return ChatGptChatProvider(
      model: model,
      message: message,
      max_tokens: max_tokens,
    );
  }

  @override
  ChatGptChatProvider getProviderOverride(
    covariant ChatGptChatProvider provider,
  ) {
    return call(
      model: provider.model,
      message: provider.message,
      max_tokens: provider.max_tokens,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatGptChatProvider';
}

/// See also [chatGptChat].
class ChatGptChatProvider extends AutoDisposeFutureProvider<List<ChatModel>> {
  /// See also [chatGptChat].
  ChatGptChatProvider({
    required this.model,
    required this.message,
    this.max_tokens,
  }) : super.internal(
          (ref) => chatGptChat(
            ref,
            model: model,
            message: message,
            max_tokens: max_tokens,
          ),
          from: chatGptChatProvider,
          name: r'chatGptChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatGptChatHash,
          dependencies: ChatGptChatFamily._dependencies,
          allTransitiveDependencies:
              ChatGptChatFamily._allTransitiveDependencies,
        );

  final String model;
  final String message;
  final int? max_tokens;

  @override
  bool operator ==(Object other) {
    return other is ChatGptChatProvider &&
        other.model == model &&
        other.message == message &&
        other.max_tokens == max_tokens;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, max_tokens.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
