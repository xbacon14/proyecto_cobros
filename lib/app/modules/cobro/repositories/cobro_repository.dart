import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';

class CobroRepository {
  Future<List<Cliente>> findByCondition(String condition) {
    return Api()
        .instance
        .get('/pessoaWS/findClientesByCondition', queryParameters: {
      'condition': condition,
    }).then((value) {
      List<Cliente> clientes = value.data
          .map<Cliente>((c) => Cliente.fromJson(c))
          .toList() as List<Cliente>;
      return clientes;
    });
  }
}
