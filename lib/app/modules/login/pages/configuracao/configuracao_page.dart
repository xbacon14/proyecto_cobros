import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';
import 'package:proyecto_cobros/app/components/concepto_button.dart';
import 'package:proyecto_cobros/app/components/inputs/text_input/text_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracaoPage extends StatelessWidget {
  const ConfiguracaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Dirección de ip del servidor',
                  style:
                      GoogleFonts.montserrat(fontSize: 20, color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextInput(
                      controller: editingController,
                      icon: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      label: "Ip del servidor",
                      enabled: true,
                    ),
                    ConceptoButton(
                      onPressed: () async {
                        final SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        String url =
                            'http://${editingController.text}/ConceptoComercialJ';
                        preferences.setString('url_server', url);
                        IPServidor.url = url;
                        Get.back();
                      },
                      label: 'Salvar',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
