import 'package:flutter_application_teste/models/cep.dart';
import 'package:http/http.dart' as http;

Future<Cep> consultar(String cep) async {
  if (cep.isEmpty) {
    throw ('Você deve enviar um CEP');
  }
  if (validarCep(cep)) {
    try {
      var res =
          await http.get(Uri.parse('https://karlaycosta.cloudns.nz/ws/${num.parse(cep)}'));

      var body = res.body;
      final tratamento = body.replaceAll('[', '');
      final tratamento2 = tratamento.replaceAll(']', '');
      return Cep.fromJson(tratamento2);
    } catch (e) {
      print('erro:$e');

      rethrow;
    }
  } else {
    throw ('CEP inválido');
  }
}

bool validarCep(String cep) {
  if (cep.length == 8) {
    for (var i = 0; i < cep.length; i++) {
      switch (cep[i]) {
        case '0':
          continue;
        case '1':
          continue;
        case '2':
          continue;
        case '3':
          continue;
        case '4':
          continue;
        case '5':
          continue;
        case '6':
          continue;
        case '7':
          continue;
        case '8':
          continue;
        case '9':
          continue;
        default:
          return false;
      }
    }
    return true;
  }
  return false;
}
