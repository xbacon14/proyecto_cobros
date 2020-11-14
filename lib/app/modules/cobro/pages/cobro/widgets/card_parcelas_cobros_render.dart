import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/formater/number_formater.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/components/banderas/bandeiras.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/efetuar_cobro/efetuar_cobro_page.dart';
import 'package:proyecto_cobros/app/utils/date/date_utils.dart';

class CardParcelasCobrosRender extends StatelessWidget {
  final ImportacaoExportacaoAppCobrancas appCobrancas;
  final Cliente cliente;
  const CardParcelasCobrosRender({Key key, this.appCobrancas, this.cliente})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const letrasColor = Color.fromRGBO(0, 0, 0, 0.8);
    const naranjaTheme = Color.fromRGBO(253, 81, 28, 1);
    double widthContainerRow = (Get.width / 4) - 10;

    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              border:
                  Border(left: BorderSide(width: 7.0, color: leftColors()))),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: Get.width - 15,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'NRO. CUOTA: ${appCobrancas.nrParcela}',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.acme()
                              .copyWith(fontSize: 20, color: letrasColor),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                appCobrancas.moeda,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.acme()
                                    .copyWith(fontSize: 20, color: letrasColor),
                              ),
                            ),
                            _bandera(appCobrancas.idMoeda),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'VENCE EL:',
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato().copyWith(
                                  fontSize: 14,
                                  color: letrasColor,
                                ),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                appCobrancas.dtVencimentoFormated(),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'TOTAL:',
                                textAlign: TextAlign.right,
                                maxLines: 2,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                formatNumber(appCobrancas.vlParcela,
                                    appCobrancas.idMoeda),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'DESCUENTO:',
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato().copyWith(
                                  fontSize: 14,
                                  color: letrasColor,
                                ),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                formatNumber(appCobrancas.vlDesconto,
                                    appCobrancas.idMoeda),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'A COBRAR:',
                                textAlign: TextAlign.right,
                                maxLines: 2,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                formatNumber(appCobrancas.vlAReceber,
                                    appCobrancas.idMoeda),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'INTERÉS:',
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato().copyWith(
                                  fontSize: 14,
                                  color: letrasColor,
                                ),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                formatNumber(
                                    appCobrancas.vlJuros, appCobrancas.idMoeda),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                'COBRADO:',
                                textAlign: TextAlign.right,
                                maxLines: 2,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                            Container(
                              width: widthContainerRow,
                              child: Text(
                                formatNumber(appCobrancas.vlRecebido,
                                    appCobrancas.idMoeda),
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.lato()
                                    .copyWith(fontSize: 14, color: letrasColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Cobrar',
            color: naranjaTheme,
            icon: Icons.attach_money,
            foregroundColor: Colors.white,
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.to(EfetuarCobroPage(
                cliente: cliente,
              ));
            },
          )
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget _bandera(int id) {
    if (id == 1) {
      return BandeiraParaguay(
        size: 10,
      );
    }
    if (id == 2) {
      return BandeiraBrasil();
    }
    if (id == 3) {
      return BandeiraEEUU();
    }
  }

  Color leftColors() {
    if (!DateUtils.toDate(appCobrancas.dtVencimento).isAfter(DateTime.now())) {
      return Colors.red;
    }
    return Colors.green;
  }
}
