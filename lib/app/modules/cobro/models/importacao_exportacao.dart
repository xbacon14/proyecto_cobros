import 'package:intl/intl.dart';

import 'recebimento.dart';

class ImportacaoExportacaoAppCobrancas {
  int id;
  int idParcela;
  int nrParcela;
  double vlPorcentagemJuros;
  double vlJuros;
  String dtVencimento;
  String dtExportacao;
  int diasVencidos;
  double vlParcela;
  double vlRecebido;
  double vlAReceber;
  double vlDesconto;
  double vlRenegociado;
  String status;
  int idPessoa;
  int idContaReceber;
  int cdContaReceber;
  int idMoeda;
  String moeda;
  String cliente;
  String ruc;
  double vlPago;
  bool vencido;
  double processado;
  String cobrador;
  String usuarioConfirmacao;
  String usuarioCancelamento;
  bool cancelado;
  double vlJurosPago;
  List<Recebimento> recebimentos;

  ImportacaoExportacaoAppCobrancas(
      {this.id,
      this.idParcela,
      this.nrParcela,
      this.vlPorcentagemJuros,
      this.vlJuros,
      this.dtVencimento,
      this.dtExportacao,
      this.diasVencidos,
      this.vlParcela,
      this.vlRecebido,
      this.vlAReceber,
      this.vlDesconto,
      this.vlRenegociado,
      this.status,
      this.idPessoa,
      this.idContaReceber,
      this.cdContaReceber,
      this.idMoeda,
      this.moeda,
      this.cliente,
      this.ruc,
      this.vlPago,
      this.vencido,
      this.processado,
      this.cobrador,
      this.usuarioConfirmacao,
      this.usuarioCancelamento,
      this.cancelado,
      this.vlJurosPago,
      this.recebimentos});

  ImportacaoExportacaoAppCobrancas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idParcela = json['idParcela'];
    nrParcela = json['nrParcela'];
    vlPorcentagemJuros = json['vlPorcentagemJuros'];
    vlJuros = (json['vlJuros']).toDouble();
    dtVencimento = json['dtVencimento'];
    dtExportacao = json['dtExportacao'];
    diasVencidos = json['diasVencidos'];
    vlParcela = json['vlParcela'];
    vlRecebido = (json['vlRecebido']).toDouble();
    vlAReceber = json['vlAReceber'];
    vlDesconto = json['vlDesconto'];
    vlRenegociado = json['vlRenegociado'];
    status = json['status'];
    idPessoa = json['idPessoa'];
    idContaReceber = json['idContaReceber'];
    cdContaReceber = json['cdContaReceber'];
    idMoeda = json['idMoeda'];
    moeda = json['moeda'];
    cliente = json['cliente'];
    ruc = json['ruc'];
    vlPago = json['vlPago'];
    vencido = json['vencido'];
    processado = json['processado'];
    cobrador = json['cobrador'];
    usuarioConfirmacao = json['usuarioConfirmacao'];
    usuarioCancelamento = json['usuarioCancelamento'];
    cancelado = json['cancelado'];
    vlJurosPago = (json['vlJurosPago']).toDouble();
    if (json['recebimentos'] != null) {
      recebimentos = new List<Recebimento>();
      json['recebimentos'].forEach(
        (v) {
          recebimentos.add(
            new Recebimento.fromJson(v),
          );
        },
      );
    } else {
      recebimentos = List<Recebimento>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idParcela'] = this.idParcela;
    data['nrParcela'] = this.nrParcela;
    data['vlPorcentagemJuros'] = this.vlPorcentagemJuros;
    data['vlJuros'] = this.vlJuros;
    data['dtVencimento'] = this.dtVencimento;
    data['dtExportacao'] = this.dtExportacao;
    data['diasVencidos'] = this.diasVencidos;
    data['vlParcela'] = this.vlParcela;
    data['vlRecebido'] = this.vlRecebido;
    data['vlAReceber'] = this.vlAReceber;
    data['vlDesconto'] = this.vlDesconto;
    data['vlRenegociado'] = this.vlRenegociado;
    data['status'] = this.status;
    data['idPessoa'] = this.idPessoa;
    data['idContaReceber'] = this.idContaReceber;
    data['cdContaReceber'] = this.cdContaReceber;
    data['idMoeda'] = this.idMoeda;
    data['moeda'] = this.moeda;
    data['cliente'] = this.cliente;
    data['ruc'] = this.ruc;
    data['vlPago'] = this.vlPago;
    data['vencido'] = this.vencido;
    data['processado'] = this.processado;
    data['cobrador'] = this.cobrador;
    data['usuarioConfirmacao'] = this.usuarioConfirmacao;
    data['usuarioCancelamento'] = this.usuarioCancelamento;
    data['cancelado'] = this.cancelado;
    data['vlJurosPago'] = this.vlJurosPago;
    if (this.recebimentos != null) {
      data['recebimentos'] = this.recebimentos.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String dtVencimentoFormated() {
    return new DateFormat("dd/MM/yyyy").format(DateTime.parse(dtVencimento));
  }
}
