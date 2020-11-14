import 'package:proyecto_cobros/app/modules/home/home_module.dart';
import 'package:proyecto_cobros/app/modules/login/pages/configuracao/configuracao_page.dart';
import 'package:proyecto_cobros/app/modules/login/pages/login/login_page.dart';
import 'package:proyecto_cobros/app/modules/login/repository/login_repository.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/solicitacao_cobro_module.dart';

import 'pages/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get())),
        Bind((i) => LoginRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/cobros', module: SolicitacaoCobroModule()),
        ModularRouter('/configuracao', child: (_, args) => ConfiguracaoPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
