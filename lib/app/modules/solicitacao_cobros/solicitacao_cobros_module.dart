import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/lista_conta/lista_conta_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/lista_conta/lista_conta_page.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/solicitacao_cobros/solicitacao_cobros_page.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/repositories/solicitacao_cobros_repository.dart';

class SolicitacaoCobrosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SolicitacaoCobrosController(i.get())),
        Bind((i) => ListaContaController(i.get())),
        Bind((i) => HistoricoController(i.get())),
        Bind((i) => SolicitacaoCobrosRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListaContaPage()),
        Router('/solicitacao_cobros',
            child: (_, args) => SolicitacaoCobrosPage()),
      ];

  static Inject get to => Inject<SolicitacaoCobrosModule>.of();
}
