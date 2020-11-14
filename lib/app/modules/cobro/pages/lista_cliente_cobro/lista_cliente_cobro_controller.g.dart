// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_cliente_cobro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaClienteCobroController on _ListaClienteCobroControllerBase, Store {
  final _$processandoAtom =
      Atom(name: '_ListaClienteCobroControllerBase.processando');

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
      Atom(name: '_ListaClienteCobroControllerBase.dataProvider');

  @override
  ObservableList<Cliente> get dataProvider {
    _$dataProviderAtom.reportRead();
    return super.dataProvider;
  }

  @override
  set dataProvider(ObservableList<Cliente> value) {
    _$dataProviderAtom.reportWrite(value, super.dataProvider, () {
      super.dataProvider = value;
    });
  }

  @override
  ObservableFuture<List<Cliente>> findByCondition(String condition) {
    final _$future = super.findByCondition(condition);
    return ObservableFuture<List<Cliente>>(_$future);
  }

  @override
  String toString() {
    return '''
processando: ${processando},
dataProvider: ${dataProvider}
    ''';
  }
}
