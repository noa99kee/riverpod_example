// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_new_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newPostsHash() => r'4450abc39308d7679aebdbe5c05ebd48b9ff90c5';

/// See also [NewPosts].
@ProviderFor(NewPosts)
final newPostsProvider =
    AutoDisposeAsyncNotifierProvider<NewPosts, List<Post>>.internal(
  NewPosts.new,
  name: r'newPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewPosts = AutoDisposeAsyncNotifier<List<Post>>;
String _$newPostHash() => r'b218f1e8582cadb8ff5320fa82c7ffbf02ead853';

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

abstract class _$NewPost extends BuildlessAutoDisposeAsyncNotifier<Post> {
  late final String id;

  FutureOr<Post> build({
    required String id,
  });
}

/// See also [NewPost].
@ProviderFor(NewPost)
const newPostProvider = NewPostFamily();

/// See also [NewPost].
class NewPostFamily extends Family<AsyncValue<Post>> {
  /// See also [NewPost].
  const NewPostFamily();

  /// See also [NewPost].
  NewPostProvider call({
    required String id,
  }) {
    return NewPostProvider(
      id: id,
    );
  }

  @override
  NewPostProvider getProviderOverride(
    covariant NewPostProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'newPostProvider';
}

/// See also [NewPost].
class NewPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NewPost, Post> {
  /// See also [NewPost].
  NewPostProvider({
    required this.id,
  }) : super.internal(
          () => NewPost()..id = id,
          from: newPostProvider,
          name: r'newPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newPostHash,
          dependencies: NewPostFamily._dependencies,
          allTransitiveDependencies: NewPostFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is NewPostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Post> runNotifierBuild(
    covariant NewPost notifier,
  ) {
    return notifier.build(
      id: id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
