import 'dart:convert';

class Cep {
  final num cep;
  final String uf;
  final String cidade;
  final String bairro;
  final String logradouro;
  Cep({
    required this.cep,
    required this.uf,
    required this.cidade,
    required this.bairro,
    required this.logradouro,
  });

  factory Cep.fromJson(String json) {
    final map = jsonDecode(json);
    return Cep(
      cep: map['cep'],
      uf: map['uf'],
      cidade: map['cidade'],
      bairro: map['bairro'],
      logradouro: map['logradouro'],
    );
  }

  @override
  String toString() {
    return '$logradouro\n$bairro\n$cidade\n$uf\n$cep';
  }
}
