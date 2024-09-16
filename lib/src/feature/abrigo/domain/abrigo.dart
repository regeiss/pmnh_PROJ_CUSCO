import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

typedef AbrigoID = String;

class Abrigo extends Equatable {
  const Abrigo({required this.id, required this.nome, required this.ativo, required this.data, required this.comentario});

  final AbrigoID id;
  final String nome;
  final String comentario;
  final Timestamp data;
  final bool ativo;

  @override
  List<Object?> get props => [id, nome, ativo];

  @override
  bool get stringify => true;

  factory Abrigo.fromMap(Map<dynamic, dynamic> value, AbrigoID id) {
    return Abrigo(
        id: id, nome: value['nome'], ativo: value['ativo'], data: value['data'], comentario: value['comentario']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nome': nome, 'ativo': ativo, 'comentario': comentario, 'data': data};
  }
}
