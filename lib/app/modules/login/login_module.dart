import 'package:proyecto_cobros/app/modules/home/home_module.dart';
import 'package:proyecto_cobros/app/modules/login/pages/login/config_page.dart';
import 'package:proyecto_cobros/app/modules/login/repository/login_repository.dart';

import 'pages/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/login/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get())),
        Bind((i) => LoginRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/home', module: HomeModule()),
        Router('/config', child: (_, args) => ConfigPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
