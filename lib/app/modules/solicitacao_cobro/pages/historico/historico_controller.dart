import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/time_line_historico_cobro_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/repository/solicitacao_cobro_repository.dart';
part 'historico_controller.g.dart';

class HistoricoController = _HistoricoControllerBase with _$HistoricoController;

abstract class _HistoricoControllerBase with Store {
  final SolicitacaoCobroRepository repository;

  @observable
  bool processando = false;

  @observable
  List<TimeLineHistoricoCobroDto> dataProvider = List();

  _HistoricoControllerBase(this.repository);

  AppCobroDetalheContaReceberDto conta = AppCobroDetalheContaReceberDto();

  @action
  Future<List<TimeLineHistoricoCobroDto>> findTimeLineHistoricos(
      int idContaReceber) {
    processando = true;
    return repository.findTimeLineHistoricos(idContaReceber).then((value) {
      dataProvider = value;
      return value; //Por que tiene una lista esperando
    }).catchError((error) {
      Alert.show(
        'Aviso',
        'No fue posible consultar la lista de Historicos.',
        Alert.ERROR,
      );
    }).whenComplete(() {
      processando = false;
    });
  }
}
