import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';

class ClienteRepository {
  Future<List<Cliente>> findByCondition(String condition) async {
    return Api()
        .instance
        .get('/pessoaWS/findClientesByCondition', queryParameters: {
      'condition': condition,
    }).then((response) {
      List<Cliente> clientes = response.data
          .map<Cliente>((c) => Cliente.fromJson(c))
          .toList() as List<Cliente>;
      return clientes;
    });
  }
}
