import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/components/formater/number_formater.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/components/banderas/bandeiras.dart';
import 'package:proyecto_cobros/app/utils/date/date_utils.dart';

class CardParcelasCobrosRender extends StatelessWidget {
  final ImportacaoExportacaoAppCobrancas appCobrancas;
  const CardParcelasCobrosRender({Key key, this.appCobrancas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthContainerRow = (Get.width / 4) - 10;

    return Card(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 5.0, color: leftColors()))),
        child: Row(
          children: <Widget>[
            Container(
              width: Get.width - 15,
              height: 105,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'NRO. CUOTA: ${appCobrancas.nrParcela}',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.acme()
                              .copyWith(fontSize: 20, color: Colors.grey),
                        ),
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
                                  .copyWith(fontSize: 20, color: Colors.grey),
                            ),
                          ),
                          _bandera(appCobrancas.idMoeda),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                color: Colors.grey,
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: widthContainerRow,
                            child: Text(
                              formatNumber(
                                  appCobrancas.vlParcela, appCobrancas.idMoeda),
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.lato()
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                color: Colors.grey,
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                color: Colors.grey,
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
                                  .copyWith(fontSize: 14, color: Colors.grey),
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
