import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/Animation/FadeAnimation.dart';

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
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  Widget _drawer() {
    return Container(
      // color: Colors.white,
      height: Get.height * 0.4,
      child: Drawer(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                  0.5,
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Color(0xFFD2691E),
                    ),
                    title: Text(
                      'Trazabilidad de Cobro',
                      style: GoogleFonts.montserrat(fontSize: 16),
                    ),
                    onTap: () {
                      Get.toNamed('/home/lista_conta');
                    },
                  ),
                ),
                FadeAnimation(
                  0.5,
                  ListTile(
                    leading: Icon(
                      Icons.monetization_on,
                      color: Color(0xFFD2691E),
                    ),
                    title: Text(
                      'Efectuar Cobros',
                      style: GoogleFonts.lato(fontSize: 16),
                    ),
                    onTap: () {
                      Get.toNamed('/home/cobros');
                    },
                  ),
                ),
                FadeAnimation(
                  1.0,
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Color(0xFFD2691E),
                    ),
                    title: Container(
                      child: Text(
                        'Salir',
                        style: GoogleFonts.montserrat(fontSize: 16),
                      ),
                    ),
                    onTap: () {
                      Get.offAndToNamed('/');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onBackPressed() {
    return Get.defaultDialog(
          middleText: 'Estas seguro que desea cerrar la secion?',
          onCancel: () {},
          buttonColor: Color(0xFFD2691E),
          confirmTextColor: Colors.white,
          onConfirm: () => exit(0),
        ) ??
        false;
  }
}
