import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/controle.button.dart';
import 'package:proyecto_cobros/app/components/inputs/text_input/text_form_input.dart';
import 'package:proyecto_cobros/app/components/inputs/text_input/text_input.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cliente/widget/cliente_render/card_cliente_render.dart';

class EfetuarCobroPage extends StatefulWidget {
  final String title;
  final Cliente cliente;

  const EfetuarCobroPage({Key key, this.title = "Efectuar Cobro", this.cliente})
      : super(key: key);
  @override
  _EfetuarCobroPageState createState() => _EfetuarCobroPageState();
}

class _EfetuarCobroPageState extends State<EfetuarCobroPage> {
  var letras = Color.fromRGBO(0, 0, 0, 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(children: [
        CardClienteRender(
          cliente: widget.cliente,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Cobrar Cuota',
            style: GoogleFonts.sansita().copyWith(fontSize: 22, color: letras),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.5,
                child: TextFormInput(label: '100.000 Gs'),
              ),
              ControleButton(onPressed: () {}, label: 'Guardar')
            ],
          ),
        ),
      ]),
    );
  }
}
