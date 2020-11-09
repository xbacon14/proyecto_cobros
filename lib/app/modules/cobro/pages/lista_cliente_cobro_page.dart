import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/widgets/card_cliente_render.dart';

class ListaClienteCobroPage extends StatefulWidget {
  @override
  _ListaClienteCobroPageState createState() => _ListaClienteCobroPageState();
}

class _ListaClienteCobroPageState
    extends ModularState<ListaClienteCobroPage, CobroController> {
  TextEditingController searchController = TextEditingController();
  CobroController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    const verde = Color.fromRGBO(92, 184, 92, 1);
    const rojo = Color.fromRGBO(254, 0, 0, 1);
    const naranja = Color.fromRGBO(253, 81, 28, 1);
    const verdeMusgo = Color.fromRGBO(0, 96, 100, 1);
    const letrasColor = Colors.black87;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: letrasColor),
        title: Container(
          height: 45,
          child: TextField(
            autofocus: false,
            controller: searchController,
            style: GoogleFonts.lato(color: letrasColor),
            onSubmitted: (value) => search(),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: letrasColor),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: letrasColor,
                ),
                onPressed: () {
                  search();
                },
              ),
              suffixStyle: TextStyle(color: letrasColor),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: letrasColor),
        backgroundColor: Colors.white,
      ),
      // ),
      body: Stack(children: [
        Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Observer(builder: (_) {
            return ListView.builder(
              reverse: false,
              itemCount: controller.dataProvider.length,
              itemBuilder: (_, int index) {
                // return Text(controller.dataProvider[index].nome);
                return CardClienteRender(
                    cliente: controller.dataProvider[index]);
              },
            );
          }),
        ),
        // Observer(builder: (_) {
        //   return Visibility(
        //       visible: controller.procesando,
        //       child: Container(
        //           width: Get.width,
        //           height: Get.height,
        //           color: Colors.grey.withOpacity(0.5),
        //           child: Center(
        //               child: CircularProgressIndicator(
        //                   backgroundColor: naranja))));
        // })
      ]),
    );
  }

  search() {
    if (searchController.text.length < 3) {
      Alert.show('Aviso', 'Es necesario 3 caracteres para inicar la busca',
          Alert.WARNING);
      return;
    }
    print(searchController.text);
    String condition =
        " BS_PESSOA.NOME like '%${searchController.text}%' or  BS_PESSOA.RUC like '%${searchController.text}%'";
    FocusScope.of(context).unfocus();
    controller.findByCondition(condition);
    // listaController.findClientes(searchController.text);
  }
}
