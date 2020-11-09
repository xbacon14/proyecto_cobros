import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro_controller.dart';

class ClienteRender extends StatelessWidget {
  final Cliente cliente;
  final CobroController controller;

  const ClienteRender({Key key, this.cliente, this.controller})
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(2, 2))
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            width: Get.width,
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: Get.width * .8,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${cliente.id} - ${cliente.nome}',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.acme()
                            .copyWith(fontSize: 18, color: letraTitulo),
                      ),
                      Row(
                        children: <Widget>[
                          Text('RUC: '),
                          Text('${cliente.ruc}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Dirección: '),
                          Text(
                            cliente?.endereco ?? 'Dirección no registrado',
                            // "Calle San Miguel 912 c/ Av Paraguay",
                            maxLines: 2,
                            style: GoogleFonts.lato()
                                .copyWith(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Teléfono: '),
                          Text(
                            cliente.telefonoFormated(),
                            style: GoogleFonts.lato()
                                .copyWith(fontSize: 12, color: Colors.black),
                          ),
                          Visibility(
                            visible: cliente.telefoneValido(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/cobros/telefone.png',
                                height: 20,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: cliente.telefoneValido(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/cobros/zap.png',
                                height: 28,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Lista Cobros',
            color: verde,
            // color: Color(0xFFD2691E),
            icon: Icons.reorder,
            foregroundColor: Colors.white,
            onTap: () {
              var idCliente = cliente.id;
              Get.toNamed('/home/cobros/listaContaReceber',
                  arguments: idCliente);
            },
          ),
        ],
      ),
    );
  }
}
