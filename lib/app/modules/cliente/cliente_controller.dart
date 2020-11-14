import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_repository.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';

part 'cliente_controller.g.dart';

@Injectable()
class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  final ClienteRepository repository;

  _ClienteControllerBase(this.repository);

  @observable
  bool processando = false;

  @observable
  List<Cliente> dataProvider = List();

  @action
  Future<List<Cliente>> findByCondition(String condition) {
    processando = true;
    return repository.findByCondition(condition).then((value) {
      dataProvider = value;
      return;
    }).catchError((onError) {
      Alert.smallShow('Error al consultar', Alert.ERROR);
    }).whenComplete(() {
      processando = false;
    });
  }
}
