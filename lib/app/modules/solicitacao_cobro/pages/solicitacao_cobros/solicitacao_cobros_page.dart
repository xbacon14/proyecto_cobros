import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/inputs/text_input/text_input.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/widget/hero_conta_receber.dart';
import 'package:proyecto_cobros/app/utils/date/date_utils.dart';

import '../../../../components/date_picker/date_picker.dart';

class SolicitacaoCobrosPage extends StatefulWidget {
  final String title;

  const SolicitacaoCobrosPage({Key key, this.title = "Solicitud de Cobros"})
      : super(key: key);

  @override
  _SolicitacaoCobrosPageState createState() => _SolicitacaoCobrosPageState();
}

class _SolicitacaoCobrosPageState extends State<SolicitacaoCobrosPage> {
  SolicitacaoCobrosController controller = Modular.get();

  TextEditingController edtObservacaoController = TextEditingController();
  TextEditingController edtFechaController = TextEditingController();

  String dtPago;
  List<String> tipoContatoList = ['Telefonico', 'Presencial'];
  String observacao;
  String tipoContato;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(57, 151, 114, 1),
        centerTitle: true,
        title: Text(widget.title),
        leading: BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child:
                  Container(child: HeroContaReceber(conta: controller.conta)),
            ),
            TextInput(
              focusNode: focusNode,
              controller: edtObservacaoController,
              label: "Observación",
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                child: DropdownButton<String>(
                    iconEnabledColor: Color.fromRGBO(57, 151, 114, 1),
                    isExpanded: true,
                    items: tipoContatoList.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style:
                              TextStyle(color: Color.fromRGBO(57, 151, 114, 1)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String novoItemSelecionado) {
                      focusNode.unfocus();
                      controller.conta.tipoContato = novoItemSelecionado;
                      setState(() {
                        tipoContato = novoItemSelecionado;
                      });
                    },
                    value: controller.conta.tipoContato),
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                DatePicker.show(
                    context,
                    DateTime.now(),
                    DateTime.now(),
                    DateTime.now().add(
                      Duration(days: 30),
                    )).then((value) {
                  if (value != null) {
                    edtFechaController.text = DateUtils.format(value);
                    dtPago = DateUtils.javaFormat(value);
                  } else {
                    edtFechaController.text = '';
                    dtPago = '';
                  }
                });
              },
              child: TextInput(
                controller: edtFechaController,
                icon: Icon(Icons.calendar_today),
                label: "Fecha de Posible Pago",
                enabled: false,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[],
              ),
            ),
          ]),
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
    );
  }

  _validar() {
    if (edtObservacaoController.value.text.length < 5) {
      Alert.smallShow(
          'Es necesario ingresar al menos 5 caracteres', Alert.WARNING);
      return;
    }

    if (tipoContato == null || tipoContato.isEmpty) {
      Alert.smallShow('El Tipo  de contato campo esta vacio', Alert.WARNING);
    }

    if (edtFechaController.value.text == '') {
      Alert.smallShow('Es necesario especificar la fecha', Alert.WARNING);
      return;
    }

    return controller.save(dtPago, edtObservacaoController.text);
  }
}
