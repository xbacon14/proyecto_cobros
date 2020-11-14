// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_conta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaCobroController on _ListaCobroControllerBase, Store {
  final _$processandoAtom = Atom(name: '_ListaCobroControllerBase.processando');

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

  final _$dataProviderAtom =
      Atom(name: '_ListaCobroControllerBase.dataProvider');

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

  final _$_ListaCobroControllerBaseActionController =
      ActionController(name: '_ListaCobroControllerBase');

  @override
  Future<List<AppCobroDetalheContaReceberDto>> findContas(String condition) {
    final _$actionInfo = _$_ListaCobroControllerBaseActionController
        .startAction(name: '_ListaCobroControllerBase.findContas');
    try {
      return super.findContas(condition);
    } finally {
      _$_ListaCobroControllerBaseActionController.endAction(_$actionInfo);
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
