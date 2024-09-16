import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

typedef PetID = String;

class Pet extends Equatable {
  const Pet({required this.id, required this.nome, required this.ativo, required this.data, required this.comentario, required this.imageURLString});

  final PetID id;
  final String nome;
  final String comentario;
  final Timestamp data;
  final String imageURLString;
  final bool ativo;

  @override
  List<Object?> get props => [id, nome, ativo];

  @override
  bool get stringify => true;

  factory Pet.fromMap(Map<dynamic, dynamic> value, PetID id) {
    return Pet(
        id: id,
        nome: value['nome'],
        ativo: value['ativo'],
        data: value['data'],
        comentario: value['comentario'],
        imageURLString: value['imageURLString']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nome': nome, 'ativo': ativo, 'comentario': comentario, 'data': data, 'imageURLString': imageURLString};
  }
}
