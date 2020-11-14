import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/repository/solicitacao_cobro_repository.dart';

part 'solicitacao_cobros_controller.g.dart';

class SolicitacaoCobrosController = _SolicitacaoCobrosControllerBase
    with _$SolicitacaoCobrosController;

abstract class _SolicitacaoCobrosControllerBase with Store {
  final SolicitacaoCobroRepository repository;

  _SolicitacaoCobrosControllerBase(this.repository);

  @observable
  AppCobroDetalheContaReceberDto conta = AppCobroDetalheContaReceberDto();

  @observable
  bool processando = false;

  @action
  Future save(String dtPago, String observacao) {
    processando = true;
    conta.descricao = observacao;
    conta.dtPagamento = dtPago;
    return repository.save(conta).then((value) {
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
}
