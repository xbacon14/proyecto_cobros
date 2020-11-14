import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/time_line_historico_cobro_dto.dart';

class CustomTimeLineTile extends StatelessWidget {
  final TimeLineHistoricoCobroDto historico;

  const CustomTimeLineTile({Key key, this.historico}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: Get.width,
        height: Get.height * .20,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Fecha: ${historico.dtHistoricoFormated()}',
                style:
                    GoogleFonts.montserrat(fontSize: 16, color: Colors.grey)),
            Text('Tipo de Contacto: ${historico.tipoContato}',
                style:
                    GoogleFonts.montserrat(fontSize: 13, color: Colors.grey)),
            Text('Fecha de prosible Pago: ${historico.dataPosivelCobro}',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey)),
            Text('Obs: ${historico.descricao}',
                maxLines: 4,
                style:
                    GoogleFonts.montserrat(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
