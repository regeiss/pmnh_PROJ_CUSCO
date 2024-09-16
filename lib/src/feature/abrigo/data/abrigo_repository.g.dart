// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abrigo_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$abrigosRepositoryHash() => r'f899abbcc3014f41ed5a760e6857d4185f593f9a';

/// See also [abrigosRepository].
@ProviderFor(abrigosRepository)
final abrigosRepositoryProvider = Provider<AbrigosRepository>.internal(
  abrigosRepository,
  name: r'abrigosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$abrigosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbrigosRepositoryRef = ProviderRef<AbrigosRepository>;
String _$abrigosQueryHash() => r'710caa9c9cf1661e29a1e876818e041f144edca1';

/// See also [abrigosQuery].
@ProviderFor(abrigosQuery)
final abrigosQueryProvider = AutoDisposeProvider<Query<Abrigo>>.internal(
  abrigosQuery,
  name: r'abrigosQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$abrigosQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbrigosQueryRef = AutoDisposeProviderRef<Query<Abrigo>>;
String _$abrigoStreamHash() => r'1572eab54c64b923f1b7df1fe904de7e6e0ee26e';

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

/// See also [abrigoStream].
@ProviderFor(abrigoStream)
const abrigoStreamProvider = AbrigoStreamFamily();

/// See also [abrigoStream].
class AbrigoStreamFamily extends Family {
  /// See also [abrigoStream].
  const AbrigoStreamFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'abrigoStreamProvider';

  /// See also [abrigoStream].
  AbrigoStreamProvider call(
    AbrigoID abrigoId,
  ) {
    return AbrigoStreamProvider(
      abrigoId,
    );
  }

  @visibleForOverriding
  @override
  AbrigoStreamProvider getProviderOverride(
    covariant AbrigoStreamProvider provider,
  ) {
    return call(
      provider.abrigoId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(Stream<Abrigo> Function(AbrigoStreamRef ref) create) {
    return _$AbrigoStreamFamilyOverride(this, create);
  }
}

class _$AbrigoStreamFamilyOverride implements FamilyOverride {
  _$AbrigoStreamFamilyOverride(this.overriddenFamily, this.create);

  final Stream<Abrigo> Function(AbrigoStreamRef ref) create;

  @override
  final AbrigoStreamFamily overriddenFamily;

  @override
  AbrigoStreamProvider getProviderOverride(
    covariant AbrigoStreamProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [abrigoStream].
class AbrigoStreamProvider extends AutoDisposeStreamProvider<Abrigo> {
  /// See also [abrigoStream].
  AbrigoStreamProvider(
    AbrigoID abrigoId,
  ) : this._internal(
          (ref) => abrigoStream(
            ref as AbrigoStreamRef,
            abrigoId,
          ),
          from: abrigoStreamProvider,
          name: r'abrigoStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$abrigoStreamHash,
          dependencies: AbrigoStreamFamily._dependencies,
          allTransitiveDependencies:
              AbrigoStreamFamily._allTransitiveDependencies,
          abrigoId: abrigoId,
        );

  AbrigoStreamProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.abrigoId,
  }) : super.internal();

  final AbrigoID abrigoId;

  @override
  Override overrideWith(
    Stream<Abrigo> Function(AbrigoStreamRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AbrigoStreamProvider._internal(
        (ref) => create(ref as AbrigoStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        abrigoId: abrigoId,
      ),
    );
  }

  @override
  (AbrigoID,) get argument {
    return (abrigoId,);
  }

  @override
  AutoDisposeStreamProviderElement<Abrigo> createElement() {
    return _AbrigoStreamProviderElement(this);
  }

  AbrigoStreamProvider _copyWith(
    Stream<Abrigo> Function(AbrigoStreamRef ref) create,
  ) {
    return AbrigoStreamProvider._internal(
      (ref) => create(ref as AbrigoStreamRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      abrigoId: abrigoId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AbrigoStreamProvider && other.abrigoId == abrigoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, abrigoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AbrigoStreamRef on AutoDisposeStreamProviderRef<Abrigo> {
  /// The parameter `abrigoId` of this provider.
  AbrigoID get abrigoId;
}

class _AbrigoStreamProviderElement
    extends AutoDisposeStreamProviderElement<Abrigo> with AbrigoStreamRef {
  _AbrigoStreamProviderElement(super.provider);

  @override
  AbrigoID get abrigoId => (origin as AbrigoStreamProvider).abrigoId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
