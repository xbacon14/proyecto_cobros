import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/timeline_historico_cobro_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/repositories/solicitacao_cobros_repository.dart';
part 'historico_controller.g.dart';

class HistoricoController = _HistoricoControllerBase with _$HistoricoController;

abstract class _HistoricoControllerBase with Store {
  final SolicitacaoCobrosRepository repository;

  _HistoricoControllerBase(this.repository);

  AppCobroDetalheContaReceberDto conta = AppCobroDetalheContaReceberDto();

  @observable
  List<TimeLineHistoricoCobroDto> dataProvider = List();

  @observable
  bool procesando = false;

  @action
  Future<List<TimeLineHistoricoCobroDto>> findTimeLineHistoricos(
      int idContaReceber) {
    procesando = true;
    return repository.findTimeLineHistoricos(idContaReceber).then((value) {
      dataProvider = value;
      return value; //Por que tiene una lisna esperando
    }).catchError((error) {
      Alert.show(
        'Aviso',
        'No fue posible consultar la lista de Historicos.',
        Alert.ERROR,
      );
    }).whenComplete(() {
      procesando = false;
    });
  }
}
