import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:proyecto_cobros/app/components/api/ip_servidor.dart';

import '../alert/alert.dart';
import 'dio_connectivity_request_retrier.dart';
import 'hostname.dart';
import 'retry_interceptor.dart';

class Api {
  Dio _dio;

  String _urlBase = "";

  Dio get instance => _dio;

  Api.init() {
    Hostname().httpURL().then((value) {
      _urlBase = value;
    });
  }

  Api() {
    print(IPServidor.url);
    BaseOptions _options = new BaseOptions(
      baseUrl: IPServidor.url,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    _dio = new Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: _onRequest, onResponse: _onResponse, onError: _onError));

    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );
  }

  _onRequest(RequestOptions options) async {}

  _onResponse(Response e) {
    // print('ON RESPONSE *******************');
    // print(e);
  }

  _onError(DioError e) {
    if (e.response != null) {
      if (e.response.statusCode == 500) {
        Alert.show('Error Interno', 'Error en el servidor', Alert.ERROR);
      }
      if (e.response.statusCode == 401 || e.response.statusCode == 403) {
        Alert.show('Acceso Inválido',
            'No estas autorizado a realizar esta operación', Alert.ERROR);
      }
    }
    return e;
  }
}
