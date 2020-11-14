import 'package:proyecto_cobros/app/modules/cobro/models/parcela.dart';

import 'conta_receber.dart';
import 'moeda.dart';
import 'moeda_recebimento.dart';

class Recebimento {
  int id;
  Parcela parcela;
  double vlRecebido;
  double vlRecebimento;
  double vlJuro;
  String cotacao;
  String dtRecebimento;
  int nrDocumento;
  String usuario;
  Moeda moeda;
  MoedaRecebimento moedaRecebimento;
  String venda;
  String caixaChica;
  ContaReceber contaReceber;
  String formaRecebimento;
  String observacao;

  Recebimento(
      {this.id,
      this.parcela,
      this.vlRecebido,
      this.vlRecebimento,
      this.vlJuro,
      this.cotacao,
      this.dtRecebimento,
      this.nrDocumento,
      this.usuario,
      this.moeda,
      this.moedaRecebimento,
      this.venda,
      this.caixaChica,
      this.contaReceber,
      this.formaRecebimento,
      this.observacao});

  Recebimento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parcela =
        json['parcela'] != null ? new Parcela.fromJson(json['parcela']) : null;
    vlRecebido = json['vlRecebido'];
    vlRecebimento = json['vlRecebimento'];
    vlJuro = json['vlJuro'];
    cotacao = json['cotacao'];
    dtRecebimento = json['dtRecebimento'];
    nrDocumento = json['nrDocumento'];
    usuario = json['usuario'];
    moeda = json['moeda'] != null ? new Moeda.fromJson(json['moeda']) : null;
    moedaRecebimento = json['moedaRecebimento'] != null
        ? new MoedaRecebimento.fromJson(json['moedaRecebimento'])
        : null;
    venda = json['venda'];
    caixaChica = json['caixaChica'];
    contaReceber = json['contaReceber'] != null
        ? new ContaReceber.fromJson(json['contaReceber'])
        : null;
    formaRecebimento = json['formaRecebimento'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.parcela != null) {
      data['parcela'] = this.parcela.toJson();
    }
    data['vlRecebido'] = this.vlRecebido;
    data['vlRecebimento'] = this.vlRecebimento;
    data['vlJuro'] = this.vlJuro;
    data['cotacao'] = this.cotacao;
    data['dtRecebimento'] = this.dtRecebimento;
    data['nrDocumento'] = this.nrDocumento;
    data['usuario'] = this.usuario;
    if (this.moeda != null) {
      data['moeda'] = this.moeda.toJson();
    }
    if (this.moedaRecebimento != null) {
      data['moedaRecebimento'] = this.moedaRecebimento.toJson();
    }
    data['venda'] = this.venda;
    data['caixaChica'] = this.caixaChica;
    if (this.contaReceber != null) {
      data['contaReceber'] = this.contaReceber.toJson();
    }
    data['formaRecebimento'] = this.formaRecebimento;
    data['observacao'] = this.observacao;
    return data;
  }
}
