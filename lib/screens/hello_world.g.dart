// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello_world.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'ebfc9aae635f9bedc7f7b49b5e625a04936b1556';

/// See also [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider =
    AutoDisposeNotifierProvider<CurrentUser, User>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = AutoDisposeNotifier<User>;
String _$clockHash() => r'550a1034849e7002fde4dd776a966d2c74e37910';

/// See also [Clock].
@ProviderFor(Clock)
final clockProvider = AutoDisposeNotifierProvider<Clock, DateTime>.internal(
  Clock.new,
  name: r'clockProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clockHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Clock = AutoDisposeNotifier<DateTime>;
String _$cityHash() => r'8b590faa368ac82f8f8081d3561b7bd27f1f2810';

/// See also [City].
@ProviderFor(City)
final cityProvider = NotifierProvider<City, String>.internal(
  City.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$City = Notifier<String>;
String _$newsHash() => r'e8f04c963f72b3da23e258eec716ac2394d2f880';

/// See also [News].
@ProviderFor(News)
final newsProvider =
    AutoDisposeAsyncNotifierProvider<News, List<NewsItem>>.internal(
  News.new,
  name: r'newsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$News = AutoDisposeAsyncNotifier<List<NewsItem>>;
String _$helloWorldHash() => r'7f57fdab5b7657ecaedc58bd2295a12568172234';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<String>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<String>;
String _$weatherHash() => r'250038b30c85695d81f2258a9fb701cf06aec6fc';

/// See also [weather].
@ProviderFor(weather)
final weatherProvider = FutureProvider<String>.internal(
  weather,
  name: r'weatherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$weatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherRef = FutureProviderRef<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
