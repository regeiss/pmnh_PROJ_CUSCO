import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/src/feature/auth/domain/app_user.dart';
import 'package:gtk_flutter/src/feature/porte/domain/porte.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'porte_repository.g.dart';

class PortesRepository {
  const PortesRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String portePath(String uid, String porteId) => 'users/$uid/portes/$porteId';
  static String portesPath(String uid) => 'users/$uid/portes';
  // static String entriesPath(String uid) => EntriesRepository.entriesPath(uid);

  // create
  Future<void> addPorte({required UserID uid, required String descricao, required Timestamp dataCriacao}) =>
      _firestore.collection(portesPath(uid)).add({
        'descricao': descricao,
        'dataCriacao': dataCriacao,
      });

  // update
  Future<void> updatePorte({required UserID uid, required Porte porte}) => _firestore.doc(portePath(uid, porte.id)).update(porte.toMap());

  // delete
  Future<void> deletePorte({required UserID uid, required PorteID porteId}) async {
    // delete where entry.jobId == job.jobId
    // final entriesRef = _firestore.collection(entriesPath(uid));
    // final entries = await entriesRef.get();
    // for (final snapshot in entries.docs) {
    //   final entry = Entry.fromMap(snapshot.data(), snapshot.id);
    //   if (entry.jobId == jobId) {
    //     await snapshot.reference.delete();
    //   }
    // }
    // delete job
    final porteRef = _firestore.doc(portePath(uid, porteId));
    await porteRef.delete();
  }

  // read
  Stream<Porte> watchPorte({required UserID uid, required PorteID porteId}) => _firestore
      .doc(portePath(uid, porteId))
      .withConverter<Porte>(
        fromFirestore: (snapshot, _) => Porte.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (porte, _) => porte.toMap(),
      )
      .snapshots()
      .map((snapshot) => snapshot.data()!);

  Stream<List<Porte>> watchPortes({required UserID uid}) =>
      queryPortes(uid: uid).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<Porte> queryPortes({required UserID uid}) => _firestore.collection(portesPath(uid)).withConverter(
        fromFirestore: (snapshot, _) => Porte.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (porte, _) => porte.toMap(),
      );

  Future<List<Porte>> fetchPortes({required UserID uid}) async {
    final portes = await queryPortes(uid: uid).get();
    return portes.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
PortesRepository portesRepository(PortesRepositoryRef ref) {
  return PortesRepository(FirebaseFirestore.instance);
}

@riverpod
Query<Porte> portesQuery(PortesQueryRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('Usuário nãp pode ser null');
  }
  final repository = ref.watch(portesRepositoryProvider);
  return repository.queryPortes(uid: user.uid);
}

@riverpod
Stream<Porte> porteStream(PorteStreamRef ref, PorteID porteId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(portesRepositoryProvider);
  return repository.watchPorte(uid: user.uid, porteId: porteId);
}
