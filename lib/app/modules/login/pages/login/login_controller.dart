import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';
import 'package:proyecto_cobros/app/modules/login/models/filial.dart';
import 'package:proyecto_cobros/app/modules/login/models/usuario.dart';
import 'package:proyecto_cobros/app/modules/login/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  bool procesando = false;

  @action
  Future<Usuario> autenticar(String login, String senha) {
    procesando = true;
    if (IPServidor.url == null || IPServidor.url.isEmpty) {
      Get.toNamed('/config');
      procesando = false;
      return null;
    }
    return repository.autenticar(login, senha).then((value) async {
      if (value.codigo == -404) {
        Alert.smallShow('El usuario o la contraseña es invalido', Alert.ERROR);
      } else {
        if (value.usuarioFilialList.length == 1) {
          await salvarFilialSessao(
                  value.usuarioFilialList[0].filial, value.sessionID)
              .then((value) {
            Get.offNamed('/home');
            return null;
          });
        } else {
          Alert.smallShow('Hay mas de una flial el usuario', Alert.WARNING);
          procesando = false;
        }
      }
      return value;
    }).whenComplete(() {
      procesando = false;
    });
  }

  @action
  Future salvarFilialSessao(Filial filial, String sessionID) {
    return repository.salvarFilialSessao(filial, sessionID).then((value) {});
  }

  Future<String> getIp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String oldIP = prefs.getString("url_server");
    return oldIP;
  }
}
