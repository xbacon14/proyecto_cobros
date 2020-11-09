// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_conta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaContaController on _ListaContaControllerBase, Store {
  final _$procesandoAtom = Atom(name: '_ListaContaControllerBase.procesando');

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

  final _$dataProviderAtom =
      Atom(name: '_ListaContaControllerBase.dataProvider');

  @override
  List<AppCobroDetalheContaReceberDto> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(List<AppCobroDetalheContaReceberDto> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$_ListaContaControllerBaseActionController =
      ActionController(name: '_ListaContaControllerBase');

  @override
  Future<List<AppCobroDetalheContaReceberDto>> findContas(String condition) {
    final _$actionInfo = _$_ListaContaControllerBaseActionController
        .startAction(name: '_ListaContaControllerBase.findContas');
    try {
      return super.findContas(condition);
    } finally {
      _$_ListaContaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
procesando: ${procesando},
dataProvider: ${dataProvider}
    ''';
  }
}
