import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        drawer: _drawer(),
        appBar: AppBar(
          leading: null,
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[Container()],
        ),
      ),
    );
  }

  _onBackPressed() {
    return Get.defaultDialog(
          middleText: 'Estas segura que desseas cerrar la session?',
          onCancel: () {},
          confirmTextColor: Colors.white,
          onConfirm: () => exit(0),
        ) ??
        false;
  }

  Widget _drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                trailing: Icon(
                  Icons.linear_scale,
                  color: Color.fromRGBO(57, 151, 114, 1),
                ),
                title: Text('Trazabilidad de cobro',
                    style: GoogleFonts.lato()
                        .copyWith(color: Color.fromRGBO(57, 151, 114, 1))),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed('/home/listaConta');
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: Icon(
                  Icons.monetization_on,
                  color: Color.fromRGBO(57, 151, 114, 1),
                ),
                title: Text('Cobros',
                    style: GoogleFonts.lato()
                        .copyWith(color: Color.fromRGBO(57, 151, 114, 1))),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed('/home/cobro');
                },
              ),
            ),
            Expanded(child: Container()),
            Card(
              elevation: 0,
              child: ListTile(
                  trailing: Icon(
                    Icons.exit_to_app,
                    color: Color.fromRGBO(57, 151, 114, 1),
                  ),
                  title: Text('Cerrar Sesión',
                      style: GoogleFonts.lato()
                          .copyWith(color: Color.fromRGBO(57, 151, 114, 1))),
                  onTap: () => Get.offAllNamed('/')),
            ),
          ],
        ),
      ),
    );
  }
}
