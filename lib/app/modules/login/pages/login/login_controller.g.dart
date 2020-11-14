// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$procesandoAtom = Atom(name: '_LoginControllerBase.procesando');

  @override
  bool get procesando {
    _$procesandoAtom.reportRead();
    return super.procesando;
  }

  @override
  set procesando(bool value) {
    _$procesandoAtom.reportWrite(value, super.procesando, () {
      super.procesando = value;
    });
  }

  final _$autenticarAsyncAction =
      AsyncAction('_LoginControllerBase.autenticar');

  @override
  Future<Usuario> autenticar(String login, String senha) {
    return _$autenticarAsyncAction.run(() => super.autenticar(login, senha));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  Future<dynamic> salvarFilialSessao(Filial filial, String sessionID) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.salvarFilialSessao');
    try {
      return super.salvarFilialSessao(filial, sessionID);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
procesando: ${procesando}
    ''';
  }
}
