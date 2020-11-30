// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cobro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CobroController on _CobroControllerBase, Store {
  final _$processandoAtom = Atom(name: '_CobroControllerBase.processando');

  @override
  bool get processando {
    _$processandoAtom.reportRead();
    return super.processando;
  }

  @override
  set processando(bool value) {
    _$processandoAtom.reportWrite(value, super.processando, () {
      super.processando = value;
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

  final _$_CobroControllerBaseActionController =
      ActionController(name: '_CobroControllerBase');

  @override
  Future<List<ImportacaoExportacaoAppCobrancas>> findByParcelasByCliente(
      int idCliente) {
    final _$actionInfo = _$_CobroControllerBaseActionController.startAction(
        name: '_CobroControllerBase.findByParcelasByCliente');
    try {
      return super.findByParcelasByCliente(idCliente);
    } finally {
      _$_CobroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> processaParcelas(
      ImportacaoExportacaoAppCobrancas appCobrancas) {
    final _$actionInfo = _$_CobroControllerBaseActionController.startAction(
        name: '_CobroControllerBase.processaParcelas');
    try {
      return super.processaParcelas(appCobrancas);
    } finally {
      _$_CobroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
processando: ${processando},
dataProvider: ${dataProvider}
    ''';
  }
}
