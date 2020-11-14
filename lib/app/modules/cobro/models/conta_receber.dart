import 'package:proyecto_cobros/app/modules/cobro/models/moeda.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/parcela.dart';

class ContaReceber {
  int id;
  int codigo;
  String historico;
  String nrDocumento;
  String pessoa;
  Moeda moeda;
  String venda;
  double vlDocumento;
  double vlJuros;
  double vlDescontos;
  double vlEntrada;
  double vlRecebido;
  double vlAReceber;
  double vlRenegociado;
  String dtCadastro;
  String dtEmissao;
  String dtVencimento;
  bool situacao;
  String avista;
  bool cancelado;
  String dtCancelamento;
  String responsavelCancelamento;
  Parcela parcelas;
  String operacoesBanco;

  ContaReceber(
      {this.id,
      this.codigo,
      this.historico,
      this.nrDocumento,
      this.pessoa,
      this.moeda,
      this.venda,
      this.vlDocumento,
      this.vlJuros,
      this.vlDescontos,
      this.vlEntrada,
      this.vlRecebido,
      this.vlAReceber,
      this.vlRenegociado,
      this.dtCadastro,
      this.dtEmissao,
      this.dtVencimento,
      this.situacao,
      this.avista,
      this.cancelado,
      this.dtCancelamento,
      this.responsavelCancelamento,
      this.parcelas,
      this.operacoesBanco});

  ContaReceber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    historico = json['historico'];
    nrDocumento = json['nrDocumento'];
    pessoa = json['pessoa'];
    moeda = json['moeda'];
    venda = json['venda'];
    vlDocumento = json['vlDocumento'];
    vlJuros = json['vlJuros'];
    vlDescontos = json['vlDescontos'];
    vlEntrada = json['vlEntrada'];
    vlRecebido = json['vlRecebido'];
    vlAReceber = json['vlAReceber'];
    vlRenegociado = json['vlRenegociado'];
    dtCadastro = json['dtCadastro'];
    dtEmissao = json['dtEmissao'];
    dtVencimento = json['dtVencimento'];
    situacao = json['situacao'];
    avista = json['avista'];
    cancelado = json['cancelado'];
    dtCancelamento = json['dtCancelamento'];
    responsavelCancelamento = json['responsavelCancelamento'];
    parcelas = json['parcelas'];
    operacoesBanco = json['operacoesBanco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['historico'] = this.historico;
    data['nrDocumento'] = this.nrDocumento;
    data['pessoa'] = this.pessoa;
    data['moeda'] = this.moeda;
    data['venda'] = this.venda;
    data['vlDocumento'] = this.vlDocumento;
    data['vlJuros'] = this.vlJuros;
    data['vlDescontos'] = this.vlDescontos;
    data['vlEntrada'] = this.vlEntrada;
    data['vlRecebido'] = this.vlRecebido;
    data['vlAReceber'] = this.vlAReceber;
    data['vlRenegociado'] = this.vlRenegociado;
    data['dtCadastro'] = this.dtCadastro;
    data['dtEmissao'] = this.dtEmissao;
    data['dtVencimento'] = this.dtVencimento;
    data['situacao'] = this.situacao;
    data['avista'] = this.avista;
    data['cancelado'] = this.cancelado;
    data['dtCancelamento'] = this.dtCancelamento;
    data['responsavelCancelamento'] = this.responsavelCancelamento;
    data['parcelas'] = this.parcelas;
    data['operacoesBanco'] = this.operacoesBanco;
    return data;
  }
}
