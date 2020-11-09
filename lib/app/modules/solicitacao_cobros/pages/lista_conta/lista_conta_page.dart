import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/lista_conta/lista_conta_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/lista_conta/widgets/lista_conta_render.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';

class ListaContaPage extends StatefulWidget {
  const ListaContaPage({Key key}) : super(key: key);

  @override
  _ListaContaPageState createState() => _ListaContaPageState();
}

class _ListaContaPageState extends State<ListaContaPage> {
  ListaContaController listaContaController =
      Modular.get<ListaContaController>();

  SolicitacaoCobrosController solicitacaoCobrosController = Modular.get();
  HistoricoController historicoController = Modular.get();

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color(0xFF052744)),
        title: Container(
          height: 45,
          child: TextField(
            autofocus: false,
            controller: searchController,
            style: GoogleFonts.lato(color: Color(0xFF052744)),
            onSubmitted: (value) => search(),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Color(0xFF052744)),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFF052744),
                  ),
                  onPressed: () {
                    search();
                  },
                ),
                suffixStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1))),
          ),
        ),
        iconTheme: IconThemeData(color: Color.fromRGBO(73, 163, 160, 1)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Observer(builder: (_) {
          return ListView.builder(
            reverse: false,
            itemCount: listaContaController.dataProvider.length,
            itemBuilder: (_, int index) {
              return ListaContaRender(
                historicoController: historicoController,
                controller: solicitacaoCobrosController,
                conta: listaContaController.dataProvider[index],
              );
            },
          );
        }),
      ),
    );
  }

  search() {
    if (searchController.text.length < 3) {
      Alert.show('Aviso', 'Es necesario 3 caracteres para inicar la busca',
          Alert.WARNING);
      return;
    }
    listaContaController.findContas(searchController.text);
  }
}
