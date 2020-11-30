import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';

class CobroRepositroy {
  Future<List<ImportacaoExportacaoAppCobrancas>> findParcelasByCliente(
      int idCliente) async {
    return Api()
        .instance
        .get('/contaReceberWS/findParcelasByCliente', queryParameters: {
      'idCliente': idCliente,
    }).then((response) {
      List<ImportacaoExportacaoAppCobrancas> parcelas = response.data
          .map<ImportacaoExportacaoAppCobrancas>(
              (c) => ImportacaoExportacaoAppCobrancas.fromJson(c))
          .toList() as List<ImportacaoExportacaoAppCobrancas>;
      return parcelas;
    });
  }

  Future processaParcelas(ImportacaoExportacaoAppCobrancas appCobrancas) {
    return Api()
        .instance
        .post(
          '/contaReceberWS/processaParcelas',
          data: appCobrancas.toJson(),
        )
        .then((value) {});
  }
}
