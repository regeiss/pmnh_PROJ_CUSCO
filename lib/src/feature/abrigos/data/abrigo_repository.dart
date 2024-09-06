import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/src/feature/abrigos/domain/abrigo.dart';

class AbrigoRepository {
  const AbrigoRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String entryPath(String uid, String entryId) => 'users/$uid/entries/$entryId';
  static String entriesPath(String uid) => 'users/$uid/entries';

  // Inclusao
  Future<void> addEntry({required AbrigoID uid, required String nome, required bool ativo, required String comentario, required Timestamp data}) =>
      _firestore.collection(entriesPath(uid)).add({'nome': nome, 'ativo': ativo, 'comentario': comentario, 'data': data});

  // Leitura
  Stream<List<Abrigo>> watchEntries({required AbrigoID uid}) =>
      queryEntries(uid: uid).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<Abrigo> queryEntries({required AbrigoID uid}) {
    Query<Abrigo> query = _firestore.collection(entriesPath(uid)).withConverter<Abrigo>(
          fromFirestore: (snapshot, _) => Abrigo.fromMap(snapshot.data()!, snapshot.id),
          toFirestore: (abrigo, _) => abrigo.toMap(),
        );

    return query;
  }
}
