// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petsRepositoryHash() => r'21509aa401cadedad6c6043ce4010d99a4fa58e2';

/// See also [petsRepository].
@ProviderFor(petsRepository)
final petsRepositoryProvider = Provider<PetsRepository>.internal(
  petsRepository,
  name: r'petsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetsRepositoryRef = ProviderRef<PetsRepository>;
String _$petsQueryHash() => r'79fdd0932377aab0f55eea7c0d67c14ab5af8d7f';

/// See also [petsQuery].
@ProviderFor(petsQuery)
final petsQueryProvider = AutoDisposeProvider<Query<Pet>>.internal(
  petsQuery,
  name: r'petsQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$petsQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetsQueryRef = AutoDisposeProviderRef<Query<Pet>>;
String _$petStreamHash() => r'42755ca5e7433a58b4ab75f6fcd640d84820a7ac';

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

/// See also [petStream].
@ProviderFor(petStream)
const petStreamProvider = PetStreamFamily();

/// See also [petStream].
class PetStreamFamily extends Family {
  /// See also [petStream].
  const PetStreamFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'petStreamProvider';

  /// See also [petStream].
  PetStreamProvider call(
    PetID petId,
  ) {
    return PetStreamProvider(
      petId,
    );
  }

  @visibleForOverriding
  @override
  PetStreamProvider getProviderOverride(
    covariant PetStreamProvider provider,
  ) {
    return call(
      provider.petId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<Pet> Function(PetStreamRef ref) create) {
    return _$PetStreamFamilyOverride(this, create);
  }
}

class _$PetStreamFamilyOverride implements FamilyOverride {
  _$PetStreamFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Pet> Function(PetStreamRef ref) create;

  @override
  final PetStreamFamily overriddenFamily;

  @override
  PetStreamProvider getProviderOverride(
    covariant PetStreamProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [petStream].
class PetStreamProvider extends AutoDisposeStreamProvider<Pet> {
  /// See also [petStream].
  PetStreamProvider(
    PetID petId,
  ) : this._internal(
          (ref) => petStream(
            ref as PetStreamRef,
            petId,
          ),
          from: petStreamProvider,
          name: r'petStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$petStreamHash,
          dependencies: PetStreamFamily._dependencies,
          allTransitiveDependencies: PetStreamFamily._allTransitiveDependencies,
          petId: petId,
        );

  PetStreamProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.petId,
  }) : super.internal();

  final PetID petId;

  @override
  Override overrideWith(
    Stream<Pet> Function(PetStreamRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PetStreamProvider._internal(
        (ref) => create(ref as PetStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        petId: petId,
      ),
    );
  }

  @override
  (PetID,) get argument {
    return (petId,);
  }

  @override
  AutoDisposeStreamProviderElement<Pet> createElement() {
    return _PetStreamProviderElement(this);
  }

  PetStreamProvider _copyWith(
    Stream<Pet> Function(PetStreamRef ref) create,
  ) {
    return PetStreamProvider._internal(
      (ref) => create(ref as PetStreamRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      petId: petId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PetStreamProvider && other.petId == petId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, petId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PetStreamRef on AutoDisposeStreamProviderRef<Pet> {
  /// The parameter `petId` of this provider.
  PetID get petId;
}

class _PetStreamProviderElement extends AutoDisposeStreamProviderElement<Pet>
    with PetStreamRef {
  _PetStreamProviderElement(super.provider);

  @override
  PetID get petId => (origin as PetStreamProvider).petId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
