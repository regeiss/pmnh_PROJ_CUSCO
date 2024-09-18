import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/auth/domain/app_user.dart';
import 'package:gtk_flutter/src/feature/pet/domain/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_repository.g.dart';

class PetsRepository {
  const PetsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String petPath(String uid, String petId) => 'pet/$petId';
  static String petsPath(String uid) => 'pet';

  // create
  Future<void> addPet(
          {required UserID uid,
          required String nome,
          required String comentario,
          required DateTime data,
          required bool ativo,
          required String imageURLString}) =>
      _firestore.collection(petsPath(uid)).add({
        'nome': nome,
        'comentario': comentario,
        'data': data.millisecondsSinceEpoch,
        'ativo': ativo,
      });

  // update
  Future<void> updatePet({required UserID uid, required Pet pet}) => _firestore.doc(petPath(uid, pet.id)).update(pet.toMap());

  // delete
  Future<void> deletePet({required UserID uid, required PetID petId}) => _firestore.doc(petPath(uid, petId)).delete();

  // read
  Stream<Pet> watchPet({required UserID uid, required PetID petId}) => _firestore
      .doc(petPath(uid, petId))
      .withConverter<Pet>(
        fromFirestore: (snapshot, _) => Pet.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (pet, _) => pet.toMap(),
      )
      .snapshots()
      .map((snapshot) => snapshot.data()!);

  Stream<List<Pet>> watchPets({required UserID uid}) => queryPets().snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

//  Query<Pet> queryPets({required UserID uid}) => _firestore.collection(petsPath(uid)).withConverter(
  Query<Pet> queryPets() => _firestore.collection('pet').withConverter(
        fromFirestore: (snapshot, _) => Pet.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (pet, _) => pet.toMap(),
      );

  Future<List<Pet>> fetchPets({required UserID uid}) async {
    final pets = await queryPets().get();
    return pets.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
PetsRepository petsRepository(PetsRepositoryRef ref) {
  return PetsRepository(FirebaseFirestore.instance);
}

@riverpod
Query<Pet> petsQuery(PetsQueryRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('Usuário deve ser informado');
  }
  final repository = ref.watch(petsRepositoryProvider);
  return repository.queryPets();
}

@riverpod
Stream<Pet> petStream(PetStreamRef ref, PetID petId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('Usuário deve ser informado');
  }
  final repository = ref.watch(petsRepositoryProvider);
  return repository.watchPet(uid: user.uid, petId: petId);
}
