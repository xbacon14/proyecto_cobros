import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';

class CardClienteRender extends StatelessWidget {
  final Cliente cliente;
  const CardClienteRender({Key key, this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: Get.width,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, top: 5),
              width: Get.width - 24,
              height: 105,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${cliente.id}- ${cliente.nome}',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.acme()
                        .copyWith(fontSize: 25, color: Colors.grey),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Ruc: ',
                        maxLines: 2,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        cliente?.ruc ?? 'Ruc no registrado',
                        maxLines: 2,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Dirección: ',
                        maxLines: 2,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        cliente?.endereco ?? 'Dirección no registrado',
                        maxLines: 2,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Telefono: ',
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        cliente.telefonoFormated(),
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 14, color: Colors.grey),
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
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
