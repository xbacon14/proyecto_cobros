import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/repositories/cobro_repository.dart';

part 'cobro_controller.g.dart';

class CobroController = _CobroControllerBase with _$CobroController;

abstract class _CobroControllerBase with Store {
  final CobroRepository repository;

  @observable
  bool procesando = false;

  @observable
  ObservableList<ImportacaoExportacaoAppCobrancas> dataProvider =
      ObservableList();

  @observable
  List<Cliente> dataProviderCliente = List();

  _CobroControllerBase(this.repository);

  @action
  Future<List<ImportacaoExportacaoAppCobrancas>> findByParcelasByCliente(
      idCliente) {
    procesando = true;
    return repository.findParcelasByCliente(idCliente).then((value) {
      dataProvider = value.asObservable();
      return;
    }).catchError((onError) {
      Alert.smallShow('Error al consultar', Alert.ERROR);
    }).whenComplete(() {
      procesando = false;
    });
  }

  @action
  Future<List<Cliente>> findByCondition(String condition) {
    procesando = true;
    return repository.findByCondition(condition).then((value) {
      dataProviderCliente = value;
      return;
    }).catchError((onError) {
      print(onError);
      Alert.smallShow('No fue posible consultar el cliente', Alert.ERROR);
    }).whenComplete(() {
      procesando = false;
    });
  }
}
