import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/app_widget.dart';
import 'package:proyecto_cobros/app/modules/login/login_module.dart';

import 'app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        // Router(Modular.initialRoute, child: (_, args) => TimeLinePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
