import 'package:shared_preferences/shared_preferences.dart';

class Hostname {
/*   String urlBaseDev = "192.168.100.14";
  String apiDev = "/api";
  int portaDev = 8080; */

  Future<String> httpURL() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get('url_server').toString();
  }

  //_hostname.urlBase = "ec2-18-216-54-44.us-east-2.compute.amazonaws.com";

//  ec2-18-216-54-44.us-east-2.compute.amazonaws.com:8080/delivery
}
