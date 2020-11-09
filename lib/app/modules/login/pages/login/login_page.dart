import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/Animation/FadeAnimation.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';
import 'package:proyecto_cobros/app/components/controle.button.dart';
import 'package:proyecto_cobros/app/components/inputs/text_inputs/text_form_input.dart';
import 'package:proyecto_cobros/app/modules/login/pages/login/login_controller.dart';

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
    _usuarioController.text = 'r';
    _senhaController.text = '2222015';
    IPServidor.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  _makeHeader(),
                  SizedBox(
                    height: 30,
                  ),
                  _makeForm(),
                  Positioned(
                    bottom: Get.height - 525,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/config');
                      },
                      child: Icon(
                        Icons.settings,
                        color: Color.fromRGBO(57, 151, 114, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Observer(builder: (_) {
              return Visibility(
                visible: loginController.procesando,
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget _makeHeader() {
    return Container(
      width: Get.width * .7,
      child: FadeAnimation(
        1.8,
        Image.asset(
          'assets/flex.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Form _makeForm() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            FadeAnimation(
              1.3,
              TextFormInput(
                controller: _usuarioController,
                icon: Icon(
                  Icons.account_circle,
                  color: Color.fromRGBO(253, 81, 28, 1),
                ),
                label: 'Login',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              1.4,
              TextFormInput(
                obscureText: true,
                controller: _senhaController,
                icon: Icon(
                  Icons.lock,
                  color: Color.fromRGBO(253, 81, 28, 1),
                ),
                label: 'Contraseña',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              1.8,
              ControleButton(
                primaryColor: Color(0xFFD2691E),
                onPressed: () {
                  _autenticar();
                },
                label: 'Entrar',
              ),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
            Text(
              "Desarrollado por FlexTech",
              style: GoogleFonts.mitr()
                  .copyWith(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void _autenticar() {
    if (_usuarioController.text.isEmpty) {
      Alert.show('Aviso', 'El usuario es requerido', Alert.WARNING);
      return;
    }
    if (_senhaController.text.isEmpty) {
      Alert.show('Aviso', 'La contraseña es requerida', Alert.WARNING);
      return;
    }
    loginController.autenticar(_usuarioController.text, _senhaController.text);
  }
}
