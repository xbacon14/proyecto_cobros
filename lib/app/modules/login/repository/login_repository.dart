import 'package:proyecto_cobros/app/components/alert/alert.dart';
import 'package:proyecto_cobros/app/components/api/api.dart';
import 'package:proyecto_cobros/app/modules/login/models/filial.dart';
import 'package:proyecto_cobros/app/modules/login/models/usuario.dart';

class LoginRepository {
  Future<Usuario> autenticar(String login, String senha) {
    return Api()
        .instance
        .get('/loginWS/findUsuarioByAutentificacao', queryParameters: {
      'login': login,
      'senha': senha,
    }).then((value) {
      return Usuario.fromJson(value.data);
    }).catchError((error) {
      Alert.show('Aviso', 'No fue posible logear', Alert.ERROR);
      return null;
    });
  }

  Future salvarFilialSessao(Filial filial, String sessionID) {
    return Api().instance.post('/loginWS/salvaFilialSessao',
        data: filial.toJson(),
        queryParameters: {'sessionID': sessionID}).then((value) {
      return value;
    }).catchError((error) {
      Alert.show('Aviso', 'No fue posible salvar la sessión', Alert.ERROR);
      print(error);
      return null;
    });
  }
}
