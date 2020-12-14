import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/app_cobro_detalhe_conta_receber_dto.dart';

class HeroContaReceber extends StatelessWidget {
  final AppCobroDetalheContaReceberDto conta;

  const HeroContaReceber({Key key, @required this.conta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: conta.idContaReceber,
      child: Card(
        child: Container(
          width: Get.width,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                color: Colors.white,
                width: Get.width * .63,
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
                      style: GoogleFonts.lato()
                          .copyWith(fontSize: 12, color: Colors.grey),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Dias vencidos: ${conta.diasVencido}',
                      style: GoogleFonts.acme().copyWith(
                        color: Colors.red.withOpacity(0.8),
                        fontSize: 16,
                      ),
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
                width: Get.width * .3,
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
    );
  }
}
