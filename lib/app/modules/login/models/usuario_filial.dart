import 'package:proyecto_cobros/app/modules/login/models/usuario.dart';

import 'filial.dart';

class UsuarioFilial {
  int id;
  Filial filial;
  Usuario usuario;

  UsuarioFilial({this.id, this.filial, this.usuario});

  UsuarioFilial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filial =
        json['filial'] != null ? new Filial.fromJson(json['filial']) : null;
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.filial != null) {
      data['filial'] = this.filial.toJson();
    }
    if (this.usuario != null) {
      data['usuario'] = this.usuario.toJson();
    }
    return data;
  }
}
