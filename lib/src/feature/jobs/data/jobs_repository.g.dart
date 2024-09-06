// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$jobsRepositoryHash() => r'99834710b25b2229bf6bd85bb1e522bfb2b61d5b';

/// See also [jobsRepository].
@ProviderFor(jobsRepository)
final jobsRepositoryProvider = Provider<JobsRepository>.internal(
  jobsRepository,
  name: r'jobsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$jobsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JobsRepositoryRef = ProviderRef<JobsRepository>;
String _$jobsQueryHash() => r'46482866aecb8be7e41fd6bdb0e2d5a6a87fc350';

/// See also [jobsQuery].
@ProviderFor(jobsQuery)
final jobsQueryProvider = AutoDisposeProvider<Query<Job>>.internal(
  jobsQuery,
  name: r'jobsQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$jobsQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef JobsQueryRef = AutoDisposeProviderRef<Query<Job>>;
String _$jobStreamHash() => r'72fc86cf080cd4a6bdb2da9f13ff81efb312521e';

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

/// See also [jobStream].
@ProviderFor(jobStream)
const jobStreamProvider = JobStreamFamily();

/// See also [jobStream].
class JobStreamFamily extends Family {
  /// See also [jobStream].
  const JobStreamFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'jobStreamProvider';

  /// See also [jobStream].
  JobStreamProvider call(
    JobID jobId,
  ) {
    return JobStreamProvider(
      jobId,
    );
  }

  @visibleForOverriding
  @override
  JobStreamProvider getProviderOverride(
    covariant JobStreamProvider provider,
  ) {
    return call(
      provider.jobId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<Job> Function(JobStreamRef ref) create) {
    return _$JobStreamFamilyOverride(this, create);
  }
}

class _$JobStreamFamilyOverride implements FamilyOverride {
  _$JobStreamFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Job> Function(JobStreamRef ref) create;

  @override
  final JobStreamFamily overriddenFamily;

  @override
  JobStreamProvider getProviderOverride(
    covariant JobStreamProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [jobStream].
class JobStreamProvider extends AutoDisposeStreamProvider<Job> {
  /// See also [jobStream].
  JobStreamProvider(
    JobID jobId,
  ) : this._internal(
          (ref) => jobStream(
            ref as JobStreamRef,
            jobId,
          ),
          from: jobStreamProvider,
          name: r'jobStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$jobStreamHash,
          dependencies: JobStreamFamily._dependencies,
          allTransitiveDependencies: JobStreamFamily._allTransitiveDependencies,
          jobId: jobId,
        );

  JobStreamProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jobId,
  }) : super.internal();

  final JobID jobId;

  @override
  Override overrideWith(
    Stream<Job> Function(JobStreamRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: JobStreamProvider._internal(
        (ref) => create(ref as JobStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jobId: jobId,
      ),
    );
  }

  @override
  (JobID,) get argument {
    return (jobId,);
  }

  @override
  AutoDisposeStreamProviderElement<Job> createElement() {
    return _JobStreamProviderElement(this);
  }

  JobStreamProvider _copyWith(
    Stream<Job> Function(JobStreamRef ref) create,
  ) {
    return JobStreamProvider._internal(
      (ref) => create(ref as JobStreamRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      jobId: jobId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JobStreamProvider && other.jobId == jobId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jobId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JobStreamRef on AutoDisposeStreamProviderRef<Job> {
  /// The parameter `jobId` of this provider.
  JobID get jobId;
}

class _JobStreamProviderElement extends AutoDisposeStreamProviderElement<Job>
    with JobStreamRef {
  _JobStreamProviderElement(super.provider);

  @override
  JobID get jobId => (origin as JobStreamProvider).jobId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
