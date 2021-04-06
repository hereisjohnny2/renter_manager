import 'package:flutter/material.dart';

class Renter extends ChangeNotifier {
  String nome;
  String endereco;
  String telefone;
  String email;
  int diaPagamento;
  double valorAluguel;

  // Construtor
  Renter(
    this.nome,
    this.telefone,
    this.endereco,
    this.valorAluguel,
    this.diaPagamento,
  );
}
