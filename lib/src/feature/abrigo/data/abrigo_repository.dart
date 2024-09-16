import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/abrigo/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/auth/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'abrigo_repository.g.dart';

class AbrigosRepository {
  const AbrigosRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String abrigoPath(String uid, String abrigoId) => 'abrigo/$abrigoId';
  static String abrigosPath(String uid) => 'abrigo';

  // create
  Future<void> addAbrigo({required UserID uid, required String nome, required String comentario, required Timestamp data, required bool ativo}) =>
      _firestore.collection(abrigosPath(uid)).add({
        'nome': nome,
        'comentario': comentario,
        'data': data,
        'ativo': ativo,
      });

  // update
  Future<void> updateAbrigo({required UserID uid, required Abrigo abrigo}) => _firestore.doc(abrigoPath(uid, abrigo.id)).update(abrigo.toMap());

  // delete
  Future<void> deleteAbrigo({required UserID uid, required AbrigoID abrigoId}) => _firestore.doc(abrigoPath(uid, abrigoId)).delete();

  // read
  Stream<Abrigo> watchAbrigo({required UserID uid, required AbrigoID abrigoId}) => _firestore
      .doc(abrigoPath(uid, abrigoId))
      .withConverter<Abrigo>(
        fromFirestore: (snapshot, _) => Abrigo.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (abrigo, _) => abrigo.toMap(),
      )
      .snapshots()
      .map((snapshot) => snapshot.data()!);

  Stream<List<Abrigo>> watchAbrigos({required UserID uid}) =>
      queryAbrigos().snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

//  Query<Abrigo> queryAbrigos({required UserID uid}) => _firestore.collection(abrigosPath(uid)).withConverter(
  Query<Abrigo> queryAbrigos() => _firestore.collection('abrigo').withConverter(
        fromFirestore: (snapshot, _) => Abrigo.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (abrigo, _) => abrigo.toMap(),
      );

  Future<List<Abrigo>> fetchAbrigos({required UserID uid}) async {
    final abrigos = await queryAbrigos().get();
    return abrigos.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
AbrigosRepository abrigosRepository(AbrigosRepositoryRef ref) {
  return AbrigosRepository(FirebaseFirestore.instance);
}

@riverpod
Query<Abrigo> abrigosQuery(AbrigosQueryRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('Usuário deve ser informado');
  }
  final repository = ref.watch(abrigosRepositoryProvider);
  return repository.queryAbrigos();
}

@riverpod
Stream<Abrigo> abrigoStream(AbrigoStreamRef ref, AbrigoID abrigoId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('Usuário deve ser informado');
  }
  final repository = ref.watch(abrigosRepositoryProvider);
  return repository.watchAbrigo(uid: user.uid, abrigoId: abrigoId);
}
