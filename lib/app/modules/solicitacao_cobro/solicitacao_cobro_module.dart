import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/lista_conta/lista_conta_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_page.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/repository/solicitacao_cobro_repository.dart';

import 'pages/lista_conta/lista_conta_page.dart';

class SolicitacaoCobroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SolicitacaoCobrosController(i.get())),
        Bind((i) => ListaCobroController(i.get())),
        Bind((i) => SolicitacaoCobroRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ListaContaPage()),
        ModularRouter('/solicitacao_cobros',
            child: (_, args) => SolicitacaoCobrosPage()),
      ];

  static Inject get to => Inject<SolicitacaoCobroModule>.of();
}
