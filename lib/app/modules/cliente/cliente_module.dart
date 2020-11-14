import 'package:proyecto_cobros/app/modules/cliente/cliente_repository.dart';

import 'cliente_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cliente_page.dart';

class ClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClienteController(i.get())),
        Bind((i) => ClienteRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ClientePage()),
      ];

  static Inject get to => Inject<ClienteModule>.of();
}
