import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/Animation/FadeAnimation.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/controle.button.dart';
import 'package:proyecto_cobros/app/components/date_picker/date_picker.dart';
import 'package:proyecto_cobros/app/components/inputs/text_inputs/text_input.dart';
import 'package:proyecto_cobros/app/components/utils/date/date_utils.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/lista_conta/lista_conta_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/widget/hero_conta_receber.dart';

import '../../../../components/date_picker/date_picker.dart';

class SolicitacaoCobrosPage extends StatefulWidget {
  final String title;

  const SolicitacaoCobrosPage({
    Key key,
    this.title = "Trazabilidad",
  }) : super(key: key);

  @override
  _SolicitacaoCobrosPageState createState() => _SolicitacaoCobrosPageState();
}

@override
void initState() {
  var idCliente = Get.arguments;
  print(idCliente);
  // const conta = listaContaController.findContas(idCliente);
}

class _SolicitacaoCobrosPageState extends State<SolicitacaoCobrosPage> {
  SolicitacaoCobrosController controller = Modular.get();
  ListaContaController listaContaController = Modular.get();
  TextEditingController edtDateController = TextEditingController();
  TextEditingController edtObservacaoController = TextEditingController();
  List<String> tipoContatoList = ['Telefónico', 'Presencial'];
  String dtPago;
  String tipoContato;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(189, 189, 189, 1),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                //   HeroContaReceber(conta: conta),
                FadeAnimation(
                  1,
                  TextInput(
                    controller: edtObservacaoController,
                    label: 'Observación',
                  ),
                ),
                FadeAnimation(
                  1.1,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: tipoContatoList.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String novoItemSelecionado) {
                        controller.conta.tipoContato = novoItemSelecionado;
                        setState(() {
                          tipoContato = novoItemSelecionado;
                        });
                      },
                      value: controller.conta.tipoContato,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.2,
                  InkWell(
                    onTap: () {
                      DatePicker.show(
                        context,
                        DateTime.now(),
                        DateTime.now(),
                        DateTime.now().add(Duration(days: 30)),
                      ).then(
                        (value) {
                          if (value != null) {
                            edtDateController.text = DateUtils.format(value);
                            dtPago = DateUtils.javaFormat(value);
                          } else {
                            edtDateController.text = '';
                            dtPago = '';
                          }
                        },
                      );
                    },
                    child: TextInput(
                      controller: edtDateController,
                      icon: Icon(Icons.calendar_today),
                      label: 'Fecha de Pago',
                      enabled: false,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 280, right: 10),
                  child: FadeAnimation(
                    1.2,
                    ControleButton(
                      onPressed: () {
                        if (edtObservacaoController.text.length < 5) {
                          Alert.show(
                            'Aviso',
                            'El campo de observación no puede tener menos de 5 carácteres.',
                            Alert.WARNING,
                          );
                          return;
                        }
                        if (tipoContato == null || tipoContato.isEmpty) {
                          Alert.show(
                            'Aviso',
                            'El campo tipo del contacto está vacio',
                            Alert.WARNING,
                          );
                          return;
                        }
                        if (edtDateController.text.isEmpty) {
                          Alert.show(
                            'Aviso',
                            'El campo de la fecha de pago está vacio.',
                            Alert.WARNING,
                          );
                          return;
                        }
                        controller
                            .save(dtPago, edtObservacaoController.text)
                            .then((value) {});
                      },
                      label: 'Guardar',
                      primaryColor: Color(0xFFD2691E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
