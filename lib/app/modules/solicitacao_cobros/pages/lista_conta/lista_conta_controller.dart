import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/repositories/solicitacao_cobros_repository.dart';

part 'lista_conta_controller.g.dart';

class ListaContaController = _ListaContaControllerBase
    with _$ListaContaController;

abstract class _ListaContaControllerBase with Store {
  final SolicitacaoCobrosRepository repository;

  _ListaContaControllerBase(this.repository);

  @observable
  bool procesando = false;

  @observable
  List<AppCobroDetalheContaReceberDto> dataProvider = List();

  @action
  Future<List<AppCobroDetalheContaReceberDto>> findContas(String condition) {
    procesando = true;
    return repository.findContas(condition).then((value) {
      dataProvider = value;
      return value; //Por que tiene una lisna esperando
    }).catchError((error) {
      Alert.smallShow(
        'No fue posible consultar la lista de cuentas.',
        Alert.ERROR,
      );
    }).whenComplete(() {
      procesando = false;
    });
  }
}
