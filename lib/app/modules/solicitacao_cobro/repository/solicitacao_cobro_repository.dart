import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/time_line_historico_cobro_dto.dart';

class SolicitacaoCobroRepository {
  Future<List<AppCobroDetalheContaReceberDto>> findContas(String condition) {
    return Api()
        .instance
        .get('/appCobroWS/findAppCobroDetalheContaReceber', queryParameters: {
      'condition': condition,
    }).then((value) {
      List<AppCobroDetalheContaReceberDto> cobros = value.data
          .map<AppCobroDetalheContaReceberDto>(
              (c) => AppCobroDetalheContaReceberDto.fromJson(c))
          .toList() as List<AppCobroDetalheContaReceberDto>;
      return cobros;
    });
  }

  Future save(AppCobroDetalheContaReceberDto conta) {
    return Api()
        .instance
        .post('/appCobroWS/saveHistorico', data: conta.toJson())
        .then((value) {});
  }

  Future<List<TimeLineHistoricoCobroDto>> findTimeLineHistoricos(
      int idContaReceber) {
    return Api()
        .instance
        .get('/appCobroWS/findTimeLineHistoricos', queryParameters: {
      'idContaReceber': idContaReceber,
    }).then((value) {
      List<TimeLineHistoricoCobroDto> cobros = value.data
          .map<TimeLineHistoricoCobroDto>(
              (c) => TimeLineHistoricoCobroDto.fromJson(c))
          .toList() as List<TimeLineHistoricoCobroDto>;
      return cobros;
    });
  }
}
