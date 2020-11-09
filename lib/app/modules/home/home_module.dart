import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/cobro/cobro_module.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/historico/historico_page.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/repositories/solicitacao_cobros_repository.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/solicitacao_cobros_module.dart';

import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => HistoricoController(i.get())),
        Bind((i) => SolicitacaoCobrosRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/lista_conta', module: SolicitacaoCobrosModule()),
        Router('/historico', child: (_, args) => HistoricoPage()),
        Router('/cobros', module: CobroModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
