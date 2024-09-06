// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'porte_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$portesRepositoryHash() => r'e9ef909db5da2a871a1f1ec0f1d9aa42132df158';

/// See also [portesRepository].
@ProviderFor(portesRepository)
final portesRepositoryProvider = Provider<PortesRepository>.internal(
  portesRepository,
  name: r'portesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$portesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PortesRepositoryRef = ProviderRef<PortesRepository>;
String _$portesQueryHash() => r'3bfa44130be6627d9037fbd4629cbd6e5b033d0d';

/// See also [portesQuery].
@ProviderFor(portesQuery)
final portesQueryProvider = AutoDisposeProvider<Query<Porte>>.internal(
  portesQuery,
  name: r'portesQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$portesQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PortesQueryRef = AutoDisposeProviderRef<Query<Porte>>;
String _$porteStreamHash() => r'fa241c8d2df4432fcad4337256badd9270b4d258';

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

/// See also [porteStream].
@ProviderFor(porteStream)
const porteStreamProvider = PorteStreamFamily();

/// See also [porteStream].
class PorteStreamFamily extends Family {
  /// See also [porteStream].
  const PorteStreamFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'porteStreamProvider';

  /// See also [porteStream].
  PorteStreamProvider call(
    PorteID porteId,
  ) {
    return PorteStreamProvider(
      porteId,
    );
  }

  @visibleForOverriding
  @override
  PorteStreamProvider getProviderOverride(
    covariant PorteStreamProvider provider,
  ) {
    return call(
      provider.porteId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<Porte> Function(PorteStreamRef ref) create) {
    return _$PorteStreamFamilyOverride(this, create);
  }
}

class _$PorteStreamFamilyOverride implements FamilyOverride {
  _$PorteStreamFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Porte> Function(PorteStreamRef ref) create;

  @override
  final PorteStreamFamily overriddenFamily;

  @override
  PorteStreamProvider getProviderOverride(
    covariant PorteStreamProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [porteStream].
class PorteStreamProvider extends AutoDisposeStreamProvider<Porte> {
  /// See also [porteStream].
  PorteStreamProvider(
    PorteID porteId,
  ) : this._internal(
          (ref) => porteStream(
            ref as PorteStreamRef,
            porteId,
          ),
          from: porteStreamProvider,
          name: r'porteStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$porteStreamHash,
          dependencies: PorteStreamFamily._dependencies,
          allTransitiveDependencies:
              PorteStreamFamily._allTransitiveDependencies,
          porteId: porteId,
        );

  PorteStreamProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.porteId,
  }) : super.internal();

  final PorteID porteId;

  @override
  Override overrideWith(
    Stream<Porte> Function(PorteStreamRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PorteStreamProvider._internal(
        (ref) => create(ref as PorteStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        porteId: porteId,
      ),
    );
  }

  @override
  (PorteID,) get argument {
    return (porteId,);
  }

  @override
  AutoDisposeStreamProviderElement<Porte> createElement() {
    return _PorteStreamProviderElement(this);
  }

  PorteStreamProvider _copyWith(
    Stream<Porte> Function(PorteStreamRef ref) create,
  ) {
    return PorteStreamProvider._internal(
      (ref) => create(ref as PorteStreamRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      porteId: porteId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PorteStreamProvider && other.porteId == porteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, porteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PorteStreamRef on AutoDisposeStreamProviderRef<Porte> {
  /// The parameter `porteId` of this provider.
  PorteID get porteId;
}

class _PorteStreamProviderElement
    extends AutoDisposeStreamProviderElement<Porte> with PorteStreamRef {
  _PorteStreamProviderElement(super.provider);

  @override
  PorteID get porteId => (origin as PorteStreamProvider).porteId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
