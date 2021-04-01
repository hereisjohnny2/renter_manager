class Renter {
  String nome;
  String telefone;
  String nomeCompleto;
  String endereco;
  double valorAluguel;
  int diaPagamento;
  List<int> inicioContrato;
  List<int> fimContrato;

  // Construtor
  Renter(
    this.nome,
    this.telefone,
    this.endereco,
    this.valorAluguel,
    this.diaPagamento, [
    this.nomeCompleto,
    this.inicioContrato,
    this.fimContrato,
  ]);
}
