import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/ticket/cobro_ticket.dart';

import 'printer_controller.dart';

class TesteTela extends StatefulWidget {
  TesteTela({Key key}) : super(key: key);

  @override
  _TesteTelaState createState() => _TesteTelaState();
}

class _TesteTelaState extends State<TesteTela> {
  final printerController = Modular.get<PrinterController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              child: Text("Single Text"),
              color: Colors.blue,
              onPressed: () => {_singleText()},
            ),
            // MaterialButton(
            //   child: Text("Double String"),
            //   color: Colors.red,
            //   onPressed: () => _teste2(),
            // ),
          ],
        ),
      ),
    );
  }

  void _singleText() async {
    CobroTicket ticket = CobroTicket();

    ImportacaoExportacaoAppCobrancas appCobrancas =
        ImportacaoExportacaoAppCobrancas(
            idMoeda: 1,
            vlRecebido: 1500000,
            cliente: "ADA GODOY GIMENEZ",
            vlParcela: 500000,
            dtVencimento: "30/12/2020",
            nrParcela: 1);
    ticket.print(appCobrancas, printerController, 1, true);
  }
}
