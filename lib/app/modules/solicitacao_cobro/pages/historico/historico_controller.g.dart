// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricoController on _HistoricoControllerBase, Store {
  final _$processandoAtom = Atom(name: '_HistoricoControllerBase.processando');

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
      Atom(name: '_HistoricoControllerBase.dataProvider');

  @override
  List<TimeLineHistoricoCobroDto> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(List<TimeLineHistoricoCobroDto> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  final _$_HistoricoControllerBaseActionController =
      ActionController(name: '_HistoricoControllerBase');

  @override
  Future<List<TimeLineHistoricoCobroDto>> findTimeLineHistoricos(
      int idContaReceber) {
    final _$actionInfo = _$_HistoricoControllerBaseActionController.startAction(
        name: '_HistoricoControllerBase.findTimeLineHistoricos');
    try {
      return super.findTimeLineHistoricos(idContaReceber);
    } finally {
      _$_HistoricoControllerBaseActionController.endAction(_$actionInfo);
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
