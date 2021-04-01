class House {
  String endereco;
  String complemento;
  String descricao;
  double valorAluguel;
  String inscricaoIptu;
  bool estadoAlugada;
  double area;

  House(this.endereco, this.complemento, this.descricao, this.valorAluguel,
      this.area, this.estadoAlugada,
      [this.inscricaoIptu]);
}
