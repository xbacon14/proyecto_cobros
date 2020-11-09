import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/widgets/card_cliente_render.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';

import 'conta_render.dart';

class ListaContaReceberPage extends StatefulWidget {
  final String title;
  final Cliente cliente;
  final AppCobroDetalheContaReceberDto conta;

  const ListaContaReceberPage(
      {Key key, this.title = "Cuentas a Cobrar", this.conta, this.cliente})
      : super(key: key);

  @override
  _ListaContaReceberPageState createState() => _ListaContaReceberPageState();
}

class _ListaContaReceberPageState extends State<ListaContaReceberPage> {
  @override
  Widget build(BuildContext context) {
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
            )),
          ),
          Container(
            width: Get.width,
            color: Colors.white,
            child: ContaRender(),
            // child: Observer(builder: (_, int index){
            //   return ContaRender()
            // })
          )
        ],
      ),
    );
  }
}
