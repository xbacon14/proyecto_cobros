import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';

class CobroPage extends StatefulWidget {
  final String title;
  final Cliente cliente;
  const CobroPage({Key key, this.title = "Cobro", this.cliente})
      : super(key: key);

  @override
  _CobroPageState createState() => _CobroPageState();
}

class _CobroPageState extends State<CobroPage> {
  final CobroController controller = Modular.get();

  @override
  void initState() {
    print("ID DO CLIENTE " + Get.arguments.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Hero(
          //   child: CardClienteRender(cliente: widget.cliente),
          // tag: 'cliente_render_$widget.cliente.id',
          // )
        ],
      ),
    );
  }
}
