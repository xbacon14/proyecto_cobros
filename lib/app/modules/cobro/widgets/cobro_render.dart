import 'package:flutter/material.dart';
import 'package:proyecto_cobros/app/components/inputs/number_input/number_input_custom.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/widgets/conta_render.dart';

class CobroRender extends StatefulWidget {
  final String title;
  final CobroController cobroController;
  final ImportacaoExportacaoAppCobrancas appCobrancas;

  const CobroRender(
      {Key key,
      this.cobroController,
      this.title = "Efectuar Cobro",
      this.appCobrancas})
      : super(key: key);

  @override
  _CobroRenderState createState() => _CobroRenderState();
}

class _CobroRenderState extends State<CobroRender> {
  @override
  Widget build(BuildContext context) {
    const verde = Color.fromRGBO(92, 184, 92, 1);
    const rojo = Color.fromRGBO(254, 0, 0, 1);
    const naranja = Color.fromRGBO(253, 81, 28, 1);
    const verdeMusgo = Color.fromRGBO(0, 96, 100, 1);
    const letraTitulo = Colors.black87;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ContaRender(),
          ),
          Text('Cobrar Cuota'),
          Row(children: [
            NumberInputCustom(
              numberValue: 0,
              themeData: ThemeData.light(),
            )
          ]),
        ],
      ),
    );
  }
}
