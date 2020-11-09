import 'package:shared_preferences/shared_preferences.dart';

class IPServidor {
  static String url = "";

  IPServidor.init() {
    SharedPreferences.getInstance().then((value) {
      String _url = value.getString("url_server");
      url = _url;
    });
  }
}
