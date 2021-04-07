import 'package:flutter/material.dart';

class Renter extends ChangeNotifier {
  String id;
  String nome;
  String endereco;
  String telefone;
  String email;
  int diaPagamento;
  double valorAluguel;

  // Construtor
  Renter({
    this.id,
    this.nome,
    this.telefone,
    this.endereco,
    this.valorAluguel,
    this.diaPagamento,
  });

  Renter.fromMap(Map snapshot, String id)
      : id = id,
        nome = snapshot['nome'],
        endereco = snapshot['endereco'],
        telefone = snapshot['telefone'],
        email = snapshot['email'],
        diaPagamento = snapshot['diaPagamento'],
        valorAluguel = snapshot['valorAluguel'];

  toJson() {
    return {
      'nome': nome,
      'telefone': telefone,
      'endereco': endereco,
      'diaPagamento': diaPagamento,
      'valorAluguel': valorAluguel,
    };
  }
}
