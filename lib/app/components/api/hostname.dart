import 'package:shared_preferences/shared_preferences.dart';

class Hostname {
  Future<String> httpURL() {
    return SharedPreferences.getInstance().then((value) {
      String url = value.getString("url_server");
      return url;
    });
  }
  // httpURL() async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   String url = shared.getString("url_server");
  //   return url;
  // }
}
