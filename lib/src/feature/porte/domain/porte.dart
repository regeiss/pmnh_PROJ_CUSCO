import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

typedef PorteID = String;

@immutable
class Porte extends Equatable {
  const Porte({required this.id, required this.descricao, required this.dataCriacao});
  final PorteID id;
  final String descricao;
  final Timestamp dataCriacao;

  @override
  List<Object> get props => [descricao, dataCriacao];

  @override
  bool get stringify => true;

  factory Porte.fromMap(Map<String, dynamic> data, String id) {
    final descricao = data['descricao'] as String;
    final dataCriacao = data['dataCriacao'];
    return Porte(
      id: id,
      descricao: descricao,
      dataCriacao: dataCriacao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'dataCriacao': dataCriacao,
    };
  }
}
