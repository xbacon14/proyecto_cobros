import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/widgets/card_cliente_render.dart';

class CobroRender extends StatelessWidget {
  final Cliente cliente;
  final CobroController cobroController;

  const CobroRender({Key key, this.cliente, this.cobroController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const verde = Color.fromRGBO(92, 184, 92, 1);
    const rojo = Color.fromRGBO(254, 0, 0, 1);
    const naranja = Color.fromRGBO(253, 81, 28, 1);
    const verdeMusgo = Color.fromRGBO(0, 96, 100, 1);
    const letraTitulo = Colors.black87;
    return Hero(
      tag: cliente.id,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Card(
          child: CardClienteRender(),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Cobros',
            color: verde,
            // color: Color(0xFFD2691E),
            icon: Icons.monetization_on,
            foregroundColor: Colors.white,
            onTap: () {
              var idCliente = cliente.id;
              Get.toNamed('/home/cobros/efetuarCobro', arguments: idCliente);
            },
          ),
        ],
      ),
    );
  }
}
