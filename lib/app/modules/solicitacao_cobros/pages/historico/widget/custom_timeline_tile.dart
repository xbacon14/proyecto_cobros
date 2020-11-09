import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/models/timeline_historico_cobro_dto.dart';

class CustomTimeLineTile extends StatelessWidget {
  final TimeLineHistoricoCobroDto historico;

  const CustomTimeLineTile({Key key, this.historico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var labelStyle = GoogleFonts.mitr().copyWith(fontSize: 16);
    var textStyle = GoogleFonts.lato().copyWith(fontSize: 12);

    return Card(
      child: Container(
        width: Get.width,
        height: Get.height * .15,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Fecha: ",
                  style: labelStyle,
                ),
                Text(
                  "${historico.dtHistoricoFormate()}",
                  overflow: TextOverflow.clip,
                  style: textStyle,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Tipo de Contacto: ",
                  style: labelStyle,
                ),
                Text(
                  "${historico.tipoContato}",
                  style: textStyle,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Fecha posible pago: ",
                  style: labelStyle,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "${historico.dataPosivelCobro}",
                  style: textStyle,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Observación: ",
                  style: labelStyle,
                ),
                Text(
                  "${historico.descricao}",
                  style: textStyle,
                )
              ],
            )
            // Text('Fecha: ${historico.dtHistorico}',
            //     style: GoogleFonts.sansita(fontSize: 16)),
            // Text('Tipo de Contacto: ${historico.tipoContato}',
            //     style: GoogleFonts.sansita(fontSize: 13)),
            // Text('Fecha de posible Pago: ${historico.dataPosivelCobro}',
            //     style: GoogleFonts.sansita(fontSize: 16)),
            // Text('Observación: ${historico.descricao}',
            //     maxLines: 4, style: GoogleFonts.sansita(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
