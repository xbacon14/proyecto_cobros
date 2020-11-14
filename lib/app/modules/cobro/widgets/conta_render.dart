import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';

class ContaRender extends StatelessWidget {
  final ImportacaoExportacaoAppCobrancas appCobrancas;

  const ContaRender({
    Key key,
    this.appCobrancas,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: Offset(2, 2))
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'NRO. CUOTA:',
                    style: GoogleFonts.sansita()
                        .copyWith(fontSize: 24, color: Colors.black),
                  ),
                  Text('${appCobrancas.idParcela}',
                      style: GoogleFonts.sansita()
                          .copyWith(fontSize: 16, color: Colors.black)),
                  Text('${appCobrancas.moeda}',
                      style: GoogleFonts.sansita()
                          .copyWith(fontSize: 22, color: Colors.black)),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/cobros/paraguaycircle.png")))),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${appCobrancas.dtVencimento}',
                              style: GoogleFonts.sansita()
                                  .copyWith(fontSize: 16, color: Colors.green)),
                          Text('${appCobrancas.vlDesconto}'),
                          Text('${appCobrancas.vlJuros}'),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vencimiento'),
                          Text('Descuento'),
                          Text('Interés'),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('1.000.000'),
                          Text('200.000'),
                          Text('800.000'),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total'),
                          Text('A cobrar'),
                          Text('Cobrado'),
                        ])
                  ]),
            ],
          )),
    );
  }
}
