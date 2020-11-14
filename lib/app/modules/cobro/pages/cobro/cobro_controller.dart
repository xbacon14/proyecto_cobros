import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/repository/cobro_repository.dart';

part 'cobro_controller.g.dart';

@Injectable()
class CobroController = _CobroControllerBase with _$CobroController;

abstract class _CobroControllerBase with Store {
  final CobroRepositroy cobroRepositroy;

  _CobroControllerBase(this.cobroRepositroy);

  @observable
  bool processando = false;

  @observable
  ObservableList<ImportacaoExportacaoAppCobrancas> dataProvider =
      ObservableList();

  @action
  Future<List<ImportacaoExportacaoAppCobrancas>> findByParcelasByCliente(
      int idCliente) {
    processando = true;
    return cobroRepositroy.findParcelasByCliente(idCliente).then((value) {
      dataProvider = value.asObservable();
      return;
    }).catchError((onError) {
      Alert.smallShow('Error al consultar', Alert.ERROR);
    }).whenComplete(() {
      processando = false;
    });
  }
}
