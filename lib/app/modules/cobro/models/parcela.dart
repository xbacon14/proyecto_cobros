import 'package:proyecto_cobros/app/modules/cobro/models/recebimento.dart';

import 'conta_receber.dart';
import 'moeda.dart';

class Parcela {
  int id;
  ContaReceber contaReceber;
  Moeda moeda;
  int nrParcela;
  double vlPorcentagemJuros;
  double vlJuros;
  String dtVencimento;
  String diasVencidos;
  double vlParcela;
  double vlRecebido;
  double vlAReceber;
  double vlDesconto;
  double vlRenegociado;
  String status;
  int vlJurosPago;
  List<Recebimento> recebimentos;

  Parcela(
      {this.id,
      this.contaReceber,
      this.moeda,
      this.nrParcela,
      this.vlPorcentagemJuros,
      this.vlJuros,
      this.dtVencimento,
      this.diasVencidos,
      this.vlParcela,
      this.vlRecebido,
      this.vlAReceber,
      this.vlDesconto,
      this.vlRenegociado,
      this.status,
      this.vlJurosPago,
      this.recebimentos});

  Parcela.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contaReceber = json['contaReceber'];
    moeda = json['moeda'];
    nrParcela = json['nrParcela'];
    vlPorcentagemJuros = json['vlPorcentagemJuros'];
    vlJuros = json['vlJuros'];
    dtVencimento = json['dtVencimento'];
    diasVencidos = json['diasVencidos'];
    vlParcela = json['vlParcela'];
    vlRecebido = json['vlRecebido'];
    vlAReceber = json['vlAReceber'];
    vlDesconto = json['vlDesconto'];
    vlRenegociado = json['vlRenegociado'];
    status = json['status'];
    vlJurosPago = json['vlJurosPago'];
    if (json['recebimentos'] != null) {
      recebimentos = new List<Null>();
      json['recebimentos'].forEach((v) {
        recebimentos.add(new Recebimento.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contaReceber'] = this.contaReceber;
    data['moeda'] = this.moeda;
    data['nrParcela'] = this.nrParcela;
    data['vlPorcentagemJuros'] = this.vlPorcentagemJuros;
    data['vlJuros'] = this.vlJuros;
    data['dtVencimento'] = this.dtVencimento;
    data['diasVencidos'] = this.diasVencidos;
    data['vlParcela'] = this.vlParcela;
    data['vlRecebido'] = this.vlRecebido;
    data['vlAReceber'] = this.vlAReceber;
    data['vlDesconto'] = this.vlDesconto;
    data['vlRenegociado'] = this.vlRenegociado;
    data['status'] = this.status;
    data['vlJurosPago'] = this.vlJurosPago;
    if (this.recebimentos != null) {
      data['recebimentos'] = this.recebimentos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
