import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/repositories/solicitacao_cobros_repository.dart';

part 'solicitacao_cobros_controller.g.dart';

class SolicitacaoCobrosController = _SolicitacaoCobrosControllerBase
    with _$SolicitacaoCobrosController;

abstract class _SolicitacaoCobrosControllerBase with Store {
  final SolicitacaoCobrosRepository repository;

  _SolicitacaoCobrosControllerBase(this.repository);

  @observable
  AppCobroDetalheContaReceberDto conta = AppCobroDetalheContaReceberDto();

  @observable
  bool procesando = false;

  @action
  Future save(String dtPago, String observacao) {
    procesando = true;
    conta.descricao = observacao;
    conta.dtPagamento = dtPago;
    return repository.save(conta).then((value) {
      Get.offAndToNamed('/home');
      Alert.smallShow('La operación fue guardada con exito', Alert.SUCCESS);
      return value;
    }).catchError((error) {
      print(error);
      Alert.smallShow('No se pudo realizar el pago', Alert.ERROR);
    }).whenComplete(() {
      procesando = false;
    });
  }
}
