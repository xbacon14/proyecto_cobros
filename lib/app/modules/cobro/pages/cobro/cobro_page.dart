import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/inputs/number_input/number_input.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/widgets/card_parcelas_cobros_render.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CobroPage extends StatefulWidget {
  final String title;
  final ImportacaoExportacaoAppCobrancas appCobrancas;
  const CobroPage({Key key, this.title = "Cobro", this.appCobrancas})
      : super(key: key);

  @override
  _CobroPageState createState() => _CobroPageState();
}

class _CobroPageState extends State<CobroPage> {
  int precision = 0;
  double monto;
  CobroController controller = Modular.get();
  final focusNode = FocusNode();

  @override
  void initState() {
    cobrador().then((value) {
      widget.appCobrancas.cobrador = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.appCobrancas.vlRecebido = 0;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cobrar"),
          centerTitle: true,
        ),
        body: Container(
          width: Get.width,
          child: Column(
            children: <Widget>[
              Hero(
                child: CardParcelasCobrosRender(
                  appCobrancas: widget.appCobrancas,
                ),
                tag: widget.appCobrancas.idParcela,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: NumberInput(
                      label: 'Monto',
                      precision: widget.appCobrancas.idMoeda == 1 ? 0 : 2,
                      numberValue: monto,
                      maxLength: 15,
                      onChanged: (value) {
                        widget.appCobrancas.vlRecebido = value;
                        widget.appCobrancas.vlPago = value;

                        setState(() {
                          monto = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _validar(),
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(57, 151, 114, 1),
        ),
      ),
    );
  }

  _validar() async {
    // var printer = const MethodChannel('com.example.proyecto_cobros/printer');

    // ImportacaoExportacaoAppCobrancas value = widget.appCobrancas;

    // value.dtExportacao = null;
    // value.dtVencimento = null;

    // await printer.invokeMethod(
    //     'imprimirTicketCobro', {"cobro": value.toJson().toString()});

    if (monto > widget.appCobrancas.vlAReceber) {
      Alert.smallShow(
          'El valor recibido es mayor al valor a cobrar', Alert.ERROR);
      return;
    }

    controller.processaParcelas(widget.appCobrancas);
  }

  Future<String> cobrador() {
    return SharedPreferences.getInstance().then((value) {
      String usuario = value.getString("usuario");
      return usuario;
    });
  }
}
