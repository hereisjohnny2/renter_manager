import 'package:renter_manager/models/house.dart';
import 'package:renter_manager/models/renter.dart';

List<Map> rentersData = [
  {
    "nome": "Fulano de Tal",
    "endereco": "Rua santahelena, centro",
    "telefone": "2299999999",
    "email": "email@mail.com",
    "diaPagamento": 5,
    "valorAluguel": 800.00
  },
  {
    "nome": "Fulano de Tal",
    "endereco": "Rua santahelena, centro",
    "telefone": "2299999999",
    "email": "email@mail.com",
    "diaPagamento": 5,
    "valorAluguel": 800.00
  },
  {
    "nome": "Fulano de Tal",
    "endereco": "Rua santahelena, centro",
    "telefone": "2299999999",
    "email": "email@mail.com",
    "diaPagamento": 5,
    "valorAluguel": 800.00
  }
];

List<Map> housesData = [
  {
    "endereco": "Rua Santahelena - Centro",
    "complemento": "Casa 3",
    "estado": false,
    "descricao": "3 Quartos, sala, cozinha, 2 banheiros e área de serviço",
    "area": 80.0,
    "valorAluguel": 800.00
  }
];

List<Renter> loadRentersDataFromFakeInfo(List<Map> fakeData) {
  List<Renter> outputRenters = [];
  for (var item in fakeData) {
    outputRenters.add(new Renter(
      item["nome"],
      item["telefone"],
      item["endereco"],
      item["valorAluguel"],
      item["dia_pagamento"],
    ));
  }
  return outputRenters;
}

List<House> loadHousesDataFromFakeInfo(List<Map> houses) {
  List<House> outputHouses = [];
  for (var house in houses) {
    outputHouses.add(new House(
      house["endereco"],
      house["complemento"],
      house["descricao"],
      house["valorAluguel"],
      house["area"],
      house["estado"],
    ));
  }
  return outputHouses;
}
