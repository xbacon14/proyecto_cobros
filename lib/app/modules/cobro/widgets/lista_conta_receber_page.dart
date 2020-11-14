import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/widgets/card_cliente_render.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';

import 'conta_render.dart';

class ListaContaReceberPage extends StatefulWidget {
  final String title;
  final Cliente cliente;
  final AppCobroDetalheContaReceberDto conta;

  ListaContaReceberPage(
      {Key key, this.title = "Cuentas a Cobrar", this.conta, this.cliente})
      : super(key: key);

  @override
  _ListaContaReceberPageState createState() => _ListaContaReceberPageState();

  final CobroController controller = Modular.get();
}

class _ListaContaReceberPageState extends State<ListaContaReceberPage> {
  @override
  Widget build(BuildContext context) {
    const verde = Color.fromRGBO(92, 184, 92, 1);
    const rojo = Color.fromRGBO(254, 0, 0, 1);
    const naranja = Color.fromRGBO(253, 81, 28, 1);
    const verdeMusgo = Color.fromRGBO(0, 96, 100, 1);
    const letraTitulo = Colors.black87;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Container(
              child: CardClienteRender(
                cliente: widget.cliente,
                slidable: false,
              ),
            ),
          ),
          Container(
              width: Get.width * 0.9,
              height: 120,
              color: Colors.white,
              child: Observer(builder: (_) {
                return ListView.builder(
                  reverse: false,
                  itemCount: widget.controller.dataProvider.length,
                  itemBuilder: (_, int index) {
                    ImportacaoExportacaoAppCobrancas appCobrancas =
                        widget.controller.dataProvider[index];
                    return Hero(
                      tag: appCobrancas.idParcela,
                      child: ContaRender(
                        appCobrancas: widget.controller.dataProvider[index],
                      ),
                    );
                  },
                );
              })
              // child: Observer(builder: (_, int index){
              //   return ContaRender()
              // })
              ),
        ],
      ),
    );
  }
}

// FlatButton(
//                 onPressed: () {
//                   Get.to(
//                     CobroRender(cliente: widget.cliente),
//                   );
//                 },
//                 child: ContaRender()),
