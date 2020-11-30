import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_controller.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_repository.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_page.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/lista_cliente_cobro/lista_cliente_cobro_page.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/lista_conta_receber/lista_parcelas_page.dart';
import 'package:proyecto_cobros/app/modules/cobro/repository/cobro_repository.dart';
import 'package:proyecto_cobros/app/modules/config/controllers/printer/printer_controller.dart';

class CobroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CobroController(i.get(), i.get())),
        Bind((i) => ClienteController(i.get())),
        Bind((i) => ClienteRepository()),
        Bind((i) => CobroRepositroy()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ListaClienteCobroPage()),
        ModularRouter('/cobro', child: (_, args) => CobroPage()),
        ModularRouter('/lista_conta_receber',
            child: (_, args) => ListaContaReceberPage()),
      ];

  static Inject get to => Inject<CobroModule>.of();
}
