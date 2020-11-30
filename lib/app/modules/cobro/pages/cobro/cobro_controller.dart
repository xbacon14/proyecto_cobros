import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/repository/cobro_repository.dart';
import 'package:proyecto_cobros/app/modules/cobro/ticket/cobro_ticket.dart';
import 'package:proyecto_cobros/app/modules/config/controllers/printer/printer_controller.dart';

part 'cobro_controller.g.dart';

@Injectable()
class CobroController = _CobroControllerBase with _$CobroController;

abstract class _CobroControllerBase with Store {
  final CobroRepositroy cobroRepositroy;
  final PrinterController printerController;

  _CobroControllerBase(this.cobroRepositroy, this.printerController);

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

  @action
  Future processaParcelas(ImportacaoExportacaoAppCobrancas appCobrancas) {
    processando = true;
    return cobroRepositroy.processaParcelas(appCobrancas).then((value) {
      _imprimeTicketCobro(appCobrancas);

      Get.offAndToNamed('/home');
      Alert.smallShow('Guardado', Alert.SUCCESS);
      return value;
    }).catchError((error) {
      print(error);
      Alert.smallShow(
          'No se pudo realizar el pago:' + error.toString(), Alert.ERROR);
    }).whenComplete(() {
      processando = false;
    });
  }

  void _imprimeTicketCobro(ImportacaoExportacaoAppCobrancas appCobrancas) {
    CobroTicket cobroTicket = CobroTicket();
    cobroTicket.print(appCobrancas, printerController, 1, true);
  }
}
