import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';

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

  Future<List<ImportacaoExportacaoAppCobrancas>> findParcelasByCliente(
      int idCliente) async {
    return Api()
        .instance
        .get('contaReceberWS/findParcelasByCliente', queryParameters: {
      'idCliente': idCliente,
    }).then((response) {
      List<ImportacaoExportacaoAppCobrancas> parcelas = response.data
          .map<ImportacaoExportacaoAppCobrancas>(
              (c) => ImportacaoExportacaoAppCobrancas.fromJson(c))
          .toList() as List<ImportacaoExportacaoAppCobrancas>;
      return parcelas;
    });
  }
}
