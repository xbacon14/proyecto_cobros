import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/lista_conta/widgets/lista_conta_render.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/lista_conta/lista_conta_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';

class ListaContaPage extends StatefulWidget {
  final String title;

  const ListaContaPage({Key key, this.title}) : super(key: key);

  @override
  _ListaContaPageState createState() => _ListaContaPageState();
}

class _ListaContaPageState extends State<ListaContaPage> {
  ListaCobroController listaCobroController = Modular.get();
  SolicitacaoCobrosController solicitacaoCobroController = Modular.get();
  HistoricoController historicoController = Modular.get();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color.fromRGBO(57, 151, 114, 1)),
        title: Container(
          height: 45,
          child: TextField(
            autofocus: false,
            controller: searchController,
            style:
                GoogleFonts.montserrat(color: Color.fromRGBO(57, 151, 114, 1)),
            decoration: InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(color: Color.fromRGBO(57, 151, 114, 1)),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(57, 151, 114, 1),
                  ),
                  onPressed: () => _search(),
                ),
                suffixStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1))),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              child: Observer(builder: (_) {
                return ListView.builder(
                  reverse: false,
                  itemCount: listaCobroController.dataProvider.length,
                  itemBuilder: (_, int index) {
                    // return getListTile(value);
                    return ListaContaRender(
                      solicitacaoController: solicitacaoCobroController,
                      conta: listaCobroController.dataProvider[index],
                      historicoController: historicoController,
                    );
                  },
                );
              })),
          Observer(builder: (_) {
            return Visibility(
              visible: listaCobroController.processando,
              child: Container(
                width: Get.width,
                height: Get.height,
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Color(0xFFFF12E0B4),
                )),
              ),
            );
          }),
        ],
      ),
    );
  }

  _search() {
    if (searchController.value.text.length < 3) {
      Alert.show('Aviso', 'Es necesario ingresar al menos 3 carácteres',
          Alert.WARNING);
      return;
    }
    FocusScope.of(context).unfocus();
    listaCobroController.findContas(searchController.value.text);
  }
}
