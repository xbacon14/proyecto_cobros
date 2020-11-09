import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/app_cobro_detalle_conta_receber_dto.dart';

class HeroContaReceber extends StatelessWidget {
  final AppCobroDetalheContaReceberDto conta;

  const HeroContaReceber({Key key, @required this.conta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: conta.idContaReceber,
        child: Card(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Colors.white,
                  // width: Get.width * .68,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${conta.cliente}',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.acme()
                            .copyWith(fontSize: 18, color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            conta.telefonoFormated(),
                            style: GoogleFonts.lato()
                                .copyWith(fontSize: 16, color: Colors.black),
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
                                height: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        conta?.endereco ?? 'Dirección no registrado',
                        // "Calle San Miguel 912 c/ Av Paraguay",
                        maxLines: 2,
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Dias vencidos: ${conta.diasVencido}',
                        style: GoogleFonts.sansita()
                            .copyWith(color: Colors.red, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(5, 5))
                    ],
                    color: Color.fromRGBO(0, 96, 100, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: Get.width * .27,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cuota',
                        style: GoogleFonts.russoOne()
                            .copyWith(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${conta.qtdParcelasPagas}/${conta.qtdParcelas}',
                        style: GoogleFonts.russoOne()
                            .copyWith(fontSize: 55, color: Colors.white),
                      )
                    ],
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
