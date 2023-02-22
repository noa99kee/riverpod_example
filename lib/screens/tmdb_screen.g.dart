// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tmdbMoviesHash() => r'9617838479a8cc97147575905f90852012f22d88';

/// See also [tmdbMovies].
@ProviderFor(tmdbMovies)
final tmdbMoviesProvider = AutoDisposeFutureProvider<List<TmdbMovie>?>.internal(
  tmdbMovies,
  name: r'tmdbMoviesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tmdbMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TmdbMoviesRef = AutoDisposeFutureProviderRef<List<TmdbMovie>?>;
String _$tmdbMovieHash() => r'915369d55da05be1bec7a5ad79bb4de55db26fda';

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

typedef TmdbMovieRef = AutoDisposeFutureProviderRef<TmdbMovie?>;

/// See also [tmdbMovie].
@ProviderFor(tmdbMovie)
const tmdbMovieProvider = TmdbMovieFamily();

/// See also [tmdbMovie].
class TmdbMovieFamily extends Family<AsyncValue<TmdbMovie?>> {
  /// See also [tmdbMovie].
  const TmdbMovieFamily();

  /// See also [tmdbMovie].
  TmdbMovieProvider call({
    required int id,
  }) {
    return TmdbMovieProvider(
      id: id,
    );
  }

  @override
  TmdbMovieProvider getProviderOverride(
    covariant TmdbMovieProvider provider,
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
  String? get name => r'tmdbMovieProvider';
}

/// See also [tmdbMovie].
class TmdbMovieProvider extends AutoDisposeFutureProvider<TmdbMovie?> {
  /// See also [tmdbMovie].
  TmdbMovieProvider({
    required this.id,
  }) : super.internal(
          (ref) => tmdbMovie(
            ref,
            id: id,
          ),
          from: tmdbMovieProvider,
          name: r'tmdbMovieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tmdbMovieHash,
          dependencies: TmdbMovieFamily._dependencies,
          allTransitiveDependencies: TmdbMovieFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is TmdbMovieProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
