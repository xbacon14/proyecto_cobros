import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_repository.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
part 'lista_cliente_cobro_controller.g.dart';

class ListaClienteCobroController = _ListaClienteCobroControllerBase
    with _$ListaClienteCobroController;

abstract class _ListaClienteCobroControllerBase with Store {
  final ClienteRepository repository;

  _ListaClienteCobroControllerBase(this.repository);

  @observable
  bool processando = false;

  @observable
  ObservableList<Cliente> dataProvider = ObservableList();

  @observable
  Future<List<Cliente>> findByCondition(String condition) async {
    return repository.findByCondition(condition).then((value) {
      dataProvider = value.asObservable();
      return value;
    });
  }
}
