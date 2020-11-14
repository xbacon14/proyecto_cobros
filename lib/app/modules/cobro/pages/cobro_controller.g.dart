// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CobroController on _CobroControllerBase, Store {
  final _$procesandoAtom = Atom(name: '_CobroControllerBase.procesando');

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

  final _$dataProviderAtom = Atom(name: '_CobroControllerBase.dataProvider');

  @override
  ObservableList<ImportacaoExportacaoAppCobrancas> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<ImportacaoExportacaoAppCobrancas> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$dataProviderClienteAtom =
      Atom(name: '_CobroControllerBase.dataProviderCliente');

  @override
  List<Cliente> get dataProviderCliente {
    _$dataProviderClienteAtom.reportRead();
    return super.dataProviderCliente;
  }

  @override
  set dataProviderCliente(List<Cliente> value) {
    _$dataProviderClienteAtom.reportWrite(value, super.dataProviderCliente, () {
      super.dataProviderCliente = value;
    });
  }

  final _$_CobroControllerBaseActionController =
      ActionController(name: '_CobroControllerBase');

  @override
  Future<List<ImportacaoExportacaoAppCobrancas>> findByParcelasByCliente(
      dynamic idCliente) {
    final _$actionInfo = _$_CobroControllerBaseActionController.startAction(
        name: '_CobroControllerBase.findByParcelasByCliente');
    try {
      return super.findByParcelasByCliente(idCliente);
    } finally {
      _$_CobroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<Cliente>> findByCondition(String condition) {
    final _$actionInfo = _$_CobroControllerBaseActionController.startAction(
        name: '_CobroControllerBase.findByCondition');
    try {
      return super.findByCondition(condition);
    } finally {
      _$_CobroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
procesando: ${procesando},
dataProvider: ${dataProvider},
dataProviderCliente: ${dataProviderCliente}
    ''';
  }
}
