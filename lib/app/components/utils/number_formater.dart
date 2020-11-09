import 'package:intl/intl.dart';

class NumberFormater{
 static final f = new NumberFormat("#,##0", "es_PY");

  static String format(double value){
    print(f.format(value));
    return f.format(value);

  }

}