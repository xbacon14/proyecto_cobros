import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/repository/solicitacao_cobro_repository.dart';

part 'lista_conta_controller.g.dart';

class ListaCobroController = _ListaCobroControllerBase
    with _$ListaCobroController;

abstract class _ListaCobroControllerBase with Store {
  final SolicitacaoCobroRepository repository;

  _ListaCobroControllerBase(this.repository);

  @observable
  bool processando = false;

  @observable
  List<AppCobroDetalheContaReceberDto> dataProvider = List();

  @action
  Future<List<AppCobroDetalheContaReceberDto>> findContas(String condition) {
    processando = true;
    return repository.findContas(condition).then((value) {
      dataProvider = value;
      return value;
    }).catchError((error) {
      Alert.show(
          'Aviso',
          'No fue posible realizar la consulta: ' + error.toString(),
          Alert.ERROR);
    }).whenComplete(() {
      processando = false;
    });
  }
}
