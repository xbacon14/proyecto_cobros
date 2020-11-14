import 'package:intl/intl.dart';

String formatNumber(double number, int idMoeda) {
  String vl = '';
  if (idMoeda == 1 || idMoeda == 3) {
    final numberFormat = NumberFormat("###,###", "es_PY");
    vl = numberFormat.format(number);
  } else {
    final numberFormat = NumberFormat("###,###.0#", "es_PY");
    vl = numberFormat.format(number);
  }
  return vl;
}
