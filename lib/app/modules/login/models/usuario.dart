import 'package:proyecto_cobros/app/modules/login/models/usuario_filial.dart';
import 'package:proyecto_cobros/app/modules/login/models/vendedor.dart';

class Usuario {
  int id;
  int codigo;
  String sessionID;
  String nome;
  String login;
  String senha;
  String lembrete;
  bool primeiroAcesso;
  bool salvarSenha;
  bool ativo;
  bool autorizaDesconto;
  bool cancelamentoVenda;
  bool cancelamentoItemVenda;
  bool autorizaVendaAbaixoCusto;
  bool abreCaixaRegistradora;
  bool autorizaDevolucao;
  bool autorizaVendaCredito;
  Vendedor vendedor;
  List<UsuarioFilial> usuarioFilialList;

  Usuario(
      {this.id,
      this.codigo,
      this.sessionID,
      this.nome,
      this.login,
      this.senha,
      this.lembrete,
      this.primeiroAcesso,
      this.salvarSenha,
      this.ativo,
      this.autorizaDesconto,
      this.cancelamentoVenda,
      this.cancelamentoItemVenda,
      this.autorizaVendaAbaixoCusto,
      this.abreCaixaRegistradora,
      this.autorizaDevolucao,
      this.autorizaVendaCredito,
      this.vendedor,
      this.usuarioFilialList});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    sessionID = json['sessionID'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
    lembrete = json['lembrete'];
    primeiroAcesso = json['primeiroAcesso'];
    salvarSenha = json['salvarSenha'];
    ativo = json['ativo'];
    autorizaDesconto = json['autorizaDesconto'];
    cancelamentoVenda = json['cancelamentoVenda'];
    cancelamentoItemVenda = json['cancelamentoItemVenda'];
    autorizaVendaAbaixoCusto = json['autorizaVendaAbaixoCusto'];
    abreCaixaRegistradora = json['abreCaixaRegistradora'];
    autorizaDevolucao = json['autorizaDevolucao'];
    autorizaVendaCredito = json['autorizaVendaCredito'];
    vendedor = json['vendedor'] != null
        ? new Vendedor.fromJson(json['vendedor'])
        : null;
    if (json['usuarioFilialList'] != null) {
      usuarioFilialList = new List<UsuarioFilial>();
      json['usuarioFilialList'].forEach((v) {
        usuarioFilialList.add(new UsuarioFilial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['sessionID'] = this.sessionID;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['lembrete'] = this.lembrete;
    data['primeiroAcesso'] = this.primeiroAcesso;
    data['salvarSenha'] = this.salvarSenha;
    data['ativo'] = this.ativo;
    data['autorizaDesconto'] = this.autorizaDesconto;
    data['cancelamentoVenda'] = this.cancelamentoVenda;
    data['cancelamentoItemVenda'] = this.cancelamentoItemVenda;
    data['autorizaVendaAbaixoCusto'] = this.autorizaVendaAbaixoCusto;
    data['abreCaixaRegistradora'] = this.abreCaixaRegistradora;
    data['autorizaDevolucao'] = this.autorizaDevolucao;
    data['autorizaVendaCredito'] = this.autorizaVendaCredito;
    if (this.vendedor != null) {
      data['vendedor'] = this.vendedor.toJson();
    }
    if (this.usuarioFilialList != null) {
      data['usuarioFilialList'] =
          this.usuarioFilialList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
