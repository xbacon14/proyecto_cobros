import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';
import 'package:proyecto_cobros/app/components/inputs/text_inputs/text_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController newEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        // BackButton(color: Colors.white),
        title: Center(
          child: Text(
            "Configuraciones",
            style: GoogleFonts.sansita().copyWith(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Color.fromRGBO(73, 163, 160, 1)),
        backgroundColor: Color.fromRGBO(253, 81, 28, 1),
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInput(
                label: IPServidor.url ?? 'IP Anterior',
                enabled: false,
              ),
              TextInput(
                label: "Nueva IP",
                controller: newEditingController,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(253, 81, 28, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 70,
                width: 120,
                child: FlatButton(
                    onPressed: () async {
                      final SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      String url =
                          "http://${newEditingController.text}/ConceptoComercialJ";
                      preferences.setString("url_server", url);
                      IPServidor.url = url;
                      Get.back();
                    },
                    child: Text(
                      "Guardar",
                      style:
                          GoogleFonts.sansita().copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _getIp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ip = prefs.getString('url_server');
    return ip;
  }
}
