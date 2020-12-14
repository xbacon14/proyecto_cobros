import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';

class ListaContaRender extends StatelessWidget {
  final AppCobroDetalheContaReceberDto conta;
  final SolicitacaoCobrosController solicitacaoController;
  final HistoricoController historicoController;

  const ListaContaRender(
      {Key key,
      @required this.conta,
      @required this.solicitacaoController,
      @required this.historicoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthContainer = Get.width - 24;
    return Hero(
      tag: conta.idContaReceber,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Card(
          child: Container(
            width: Get.width,
            child: Row(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, bottom: 5, right: 5),
                  color: Colors.white,
                  width: widthContainer * .65,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${conta.cliente}',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.acme()
                            .copyWith(fontSize: 18, color: Colors.grey),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            conta.telefonoFormated(),
                            style: GoogleFonts.lato()
                                .copyWith(fontSize: 16, color: Colors.grey),
                          ),
                          Visibility(
                            visible: conta.telefoneValido(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/cobros/telefone.png',
                                height: 20,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: conta.telefoneValido(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                'assets/cobros/zap.png',
                                height: 25,
                              ),
                            ),
                          ),
                          // Image.asset(
                          //   '/cobros/zap',
                          //   height: 15,
                          // )
                        ],
                      ),
                      Text(
                        conta?.endereco ?? 'Dirección no registrado',
                        // "Calle San Miguel 912 c/ Av Paraguay",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 11, color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Dias vencidos: ${conta.diasVencido}',
                        style: GoogleFonts.acme().copyWith(
                            color: Colors.red.withOpacity(0.7), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(5, 5))
                      ],
                      color: Color.fromRGBO(189, 189, 189, 1),
                      borderRadius: BorderRadius.circular(5)),
                  width: widthContainer * .3,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cuota',
                        style: GoogleFonts.russoOne()
                            .copyWith(fontSize: 20, color: Colors.white),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        '${conta.qtdParcelasPagas}/${conta.qtdParcelas}',
                        style: GoogleFonts.russoOne()
                            .copyWith(fontSize: 48, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Trazabilidad',
            color: Color.fromRGBO(57, 151, 114, 1),
            icon: Icons.receipt,
            foregroundColor: Colors.white,
            onTap: () {
              FocusScope.of(context).unfocus();
              solicitacaoController.conta = conta;
              Get.toNamed('/home/listaConta/solicitacao_cobros');
            },
          ),
          IconSlideAction(
            caption: 'Histórico',
            color: Colors.grey,
            icon: Icons.reorder,
            foregroundColor: Colors.white,
            onTap: () {
              FocusScope.of(context).unfocus();
              historicoController.conta = conta;
              historicoController.findTimeLineHistoricos(conta.idContaReceber);
              Get.toNamed('/home/historico');
            },
          )
        ],
      ),
    );
  }
}
