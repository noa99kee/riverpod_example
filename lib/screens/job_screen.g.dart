// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$jobsHash() => r'aefbe88090cf6bf55cd2c253656783ee4de56595';

/// See also [Jobs].
@ProviderFor(Jobs)
final jobsProvider = AutoDisposeNotifierProvider<Jobs, List<Job>>.internal(
  Jobs.new,
  name: r'jobsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$jobsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Jobs = AutoDisposeNotifier<List<Job>>;
String _$completedJobsHash() => r'61de00f53b0b295ed2f4cfba3b7409a5fd455619';

/// See also [completedJobs].
@ProviderFor(completedJobs)
final completedJobsProvider = AutoDisposeProvider<List<Job>>.internal(
  completedJobs,
  name: r'completedJobsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$completedJobsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompletedJobsRef = AutoDisposeProviderRef<List<Job>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
