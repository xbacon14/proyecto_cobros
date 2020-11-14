// import 'package:configure_app/app/components/alert/alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';
import 'package:proyecto_cobros/app/components/button/round_button.dart';
import 'package:proyecto_cobros/app/components/concepto_button.dart';
import 'package:proyecto_cobros/app/components/concepto_text_form_field.dart';
import 'package:proyecto_cobros/app/components/inputs/text_input/text_input.dart';
import 'package:proyecto_cobros/app/utils/size_utils.dart';
import 'package:proyecto_cobros/app/utils/themeUtils.dart';
import 'login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Modular.get();

  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  void initState() {
    _usuarioController.text = 'R';
    _senhaController.text = '2222015';

    IPServidor.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context);
    ThemeUtils.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  _makeLogin(),
                ],
              ),
              Observer(builder: (_) {
                return Visibility(
                  visible: loginController.procesando,
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white,
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(57, 151, 114, 1),
                    )),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _makeLogin() {
    return Column(
      children: [
        Container(
          color: Colors.grey.withOpacity(.03),
          width: Get.width,
          height: 150,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/flex.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 170,
                child: Text(
                  "Gestión de Cobros",
                  style: TextStyle(
                    color: Color.fromRGBO(57, 151, 114, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 170,
                child: Text(
                  "App integrado de cobros y trazabilidad",
                  style: TextStyle(
                    color: Color.fromRGBO(57, 151, 114, 1),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey.withOpacity(.03),
          height: Get.height - SizeUtils.statusBarheight,
          width: SizeUtils.widthScreen,
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              TextInput(
                controller: _usuarioController,
                label: 'Usuario',
                icon: Icon(Icons.supervised_user_circle,
                    color: Color.fromRGBO(57, 151, 114, 1)),
              ),
              SizedBox(
                height: 10,
              ),
              TextInput(
                controller: _senhaController,
                isPassword: true,
                label: 'Contraseña',
                icon: Icon(
                  Icons.https,
                  color: Color.fromRGBO(57, 151, 114, 1),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: (RaisedButton(
                        child: Row(
                          children: [
                            Text("Entrar",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.launch,
                              color: Colors.white,
                            )
                          ],
                        ),
                        color: Color.fromRGBO(57, 151, 114, 1),
                        onPressed: () => _autenticar(),
                      )),
                    ),
                    Positioned(
                      bottom: Get.height - 525,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/configuracao');
                        },
                        child: Icon(
                          Icons.settings,
                          color: Color.fromRGBO(57, 151, 114, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _autenticar() {
    if (_usuarioController.text.isEmpty) {
      Alert.show('Aviso', 'Debe informar el usuario', Alert.WARNING);
      return;
    }
    if (_senhaController.text.isEmpty) {
      Alert.show('Aviso', 'Debe informar la contraseña', Alert.WARNING);
      return;
    }
    loginController.autenticar(_usuarioController.text, _senhaController.text);
  }
}
