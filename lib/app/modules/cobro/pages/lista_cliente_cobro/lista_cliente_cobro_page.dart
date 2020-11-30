import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_controller.dart';
import 'package:proyecto_cobros/app/modules/cliente/widget/cliente_render/cliente_render.dart';

class ListaClienteCobroPage extends StatefulWidget {
  ListaClienteCobroPage({Key key}) : super(key: key);

  @override
  _ListaClienteCobroPageState createState() => _ListaClienteCobroPageState();
}

class _ListaClienteCobroPageState extends State<ListaClienteCobroPage> {
  TextEditingController searchController = TextEditingController();
  ClienteController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  itemCount: controller.dataProvider.length,
                  itemBuilder: (_, int index) {
                    return ClienteRender(
                      cliente: controller.dataProvider[index],
                      clienteController: controller,
                    );
                  },
                );
              })),
          Observer(builder: (_) {
            return Visibility(
              visible: controller.processando,
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
    String condition =
        " BS_PESSOA.NOME like '%${searchController.text}%' or  BS_PESSOA.RUC like '%${searchController.text}%'";
    FocusScope.of(context).unfocus();
    controller.findByCondition(condition);
  }
}
