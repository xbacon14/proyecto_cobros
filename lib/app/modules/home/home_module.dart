import 'package:proyecto_cobros/app/modules/cobro/cobro_module.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/historico_page.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/repository/solicitacao_cobro_repository.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/solicitacao_cobro_module.dart';

import 'pages/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => HistoricoController(i.get())),
        Bind((i) => SolicitacaoCobroRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/historico', child: (_, args) => HistoricoPage()),
        ModularRouter('/listaConta', module: SolicitacaoCobroModule()),
        ModularRouter('/cobro', module: CobroModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
