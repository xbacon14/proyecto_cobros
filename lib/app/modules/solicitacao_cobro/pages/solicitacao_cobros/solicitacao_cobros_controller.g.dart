// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_cobros_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SolicitacaoCobrosController on _SolicitacaoCobrosControllerBase, Store {
  final _$contaAtom = Atom(name: '_SolicitacaoCobrosControllerBase.conta');

  @override
  AppCobroDetalheContaReceberDto get conta {
    _$contaAtom.reportRead();
    return super.conta;
  }

  @override
  set conta(AppCobroDetalheContaReceberDto value) {
    _$contaAtom.reportWrite(value, super.conta, () {
      super.conta = value;
    });
  }

  final _$processandoAtom =
      Atom(name: '_SolicitacaoCobrosControllerBase.processando');

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

  final _$_SolicitacaoCobrosControllerBaseActionController =
      ActionController(name: '_SolicitacaoCobrosControllerBase');

  @override
  Future<dynamic> save(String dtPago, String observacao) {
    final _$actionInfo = _$_SolicitacaoCobrosControllerBaseActionController
        .startAction(name: '_SolicitacaoCobrosControllerBase.save');
    try {
      return super.save(dtPago, observacao);
    } finally {
      _$_SolicitacaoCobrosControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conta: ${conta},
processando: ${processando}
    ''';
  }
}
