import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cliente/cliente_controller.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cliente/widget/cliente_render/card_cliente_render.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/lista_conta_receber/lista_parcelas_page.dart';

class ClienteRender extends StatelessWidget {
  final Cliente cliente;
  final ClienteController clienteController;
  final CobroController cobroController;

  const ClienteRender(
      {Key key, this.cliente, this.clienteController, this.cobroController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const naranjaTheme = Color.fromRGBO(253, 81, 28, 1);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Hero(tag: cliente.id, child: CardClienteRender(cliente: cliente)),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Cobrar',
          color: naranjaTheme,
          icon: Icons.attach_money,
          foregroundColor: Colors.white,
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.to(ListaContaReceberPage(cliente: cliente));
          },
        )
      ],
    );
  }
}
