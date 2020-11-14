import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/lista_cliente_cobro_page.dart';

import 'pages/cobro_controller.dart';
import 'repositories/cobro_repository.dart';
import 'widgets/cobro_render.dart';
import 'widgets/lista_conta_receber_page.dart';

class CobroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CobroController(i.get())),
        Bind((i) => CobroRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ListaClienteCobroPage()),
        Router('/listaContaReceber',
            child: (_, args) => ListaContaReceberPage()),
        // Router('/efetuarCobro', child: (_, args) => CobroRender()),
      ];

  static Inject get to => Inject<CobroModule>.of();
}
