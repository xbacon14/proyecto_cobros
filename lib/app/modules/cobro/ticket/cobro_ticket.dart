import 'package:intl/intl.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/config/controllers/printer/printer_controller.dart';

class CobroTicket {
  final dateFormatter = new DateFormat('dd/MM/yy  kk:mm', 'es_PY');
  final numberFormat = NumberFormat('###,###.##', 'es_PY');
  final dolarFormat = NumberFormat('#,###.00', 'es_PY');

  print(
      ImportacaoExportacaoAppCobrancas appCobrancas,
      PrinterController printerController,
      int qtdTicket,
      bool isReimpressao) async {
    // printerController.printerInit();
    final dateFormatter = new DateFormat('dd/MM/yy', 'es_PY');
    final hourFormatter = new DateFormat('kk:mm', 'es_PY');
    final numberFormat = NumberFormat('###,###.##', 'es_PY');

    for (var i = 0; i < qtdTicket; i++) {
      printerController.setFontSize(25);
      printerController.lineWrap(1);
      printerController.printTextWithFont('RECIBO\n', '', 40, 1);
      printerController.printColumnsText(
        [
          'Valor:',
          _vlTotal(appCobrancas.idMoeda, appCobrancas.vlRecebido),
        ],
        [15, 14],
        [2, 2],
      );
      printerController.printColumnsText(
        [
          'Emision:',
          '${dateFormatter.format(DateTime.now())}',
        ],
        [15, 14],
        [2, 2],
      );

      printerController.printColumnsText(
        [
          'Hora:',
          '${hourFormatter.format(DateTime.now())}',
        ],
        [15, 14],
        [2, 2],
      );
      printerController.printDivider();
      printerController.setAlignment(0);
      printerController.printText(
          "En el dia : 28/11/2020 recibo\nsolidariamente del sr (a):\n" +
              "${appCobrancas.cliente}\n" +
              "la suma de ${_vlTotal(appCobrancas.idMoeda, appCobrancas.vlRecebido)}\n" +
              "En concepto de pago total o\n" +
              "parcial de las cuentas seguidas\n");
      printerController.printDivider();
      printerController.setAlignment(0);
      printerController.printText("Cuta Numero ${appCobrancas.nrParcela} con\n" +
          "vencimiento el ${appCobrancas.dtVencimento} en\n" +
          "el valor de ${_vlTotal(appCobrancas.idMoeda, appCobrancas.vlParcela)}\n" +
          "ahora pendiente G\$ 100.000\n");
      printerController.printDivider();
      printerController.setAlignment(0);
      printerController.printText(
          "Por igual valor recibido a\n" + "nuestra entera satisfaccion\n");
      printerController.printDivider();
      printerController.setAlignment(0);
      printerController.lineWrap(2);
      printerController.printTextWithFont('FIRMA\n', '', 30, 1);
      printerController.lineWrap(3);
    }
  }

  String _vlTotal(int idMoeda, double valor) {
    if (idMoeda == 1) {
      return '${numberFormat.format(valor)} G\$';
    }
    if (idMoeda == 2) {
      return '${numberFormat.format(valor)} U\$';
    }
    if (idMoeda == 3) {
      return '${numberFormat.format(valor)} R\$';
    }
  }
}
