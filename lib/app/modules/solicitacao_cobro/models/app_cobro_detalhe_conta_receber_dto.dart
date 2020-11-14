import 'package:mobx/mobx.dart';
part 'app_cobro_detalhe_conta_receber_dto.g.dart';

class AppCobroDetalheContaReceberDto = _AppCobroDetalheContaReceberDtoBase
    with _$AppCobroDetalheContaReceberDto;

abstract class _AppCobroDetalheContaReceberDtoBase with Store {
  String cliente;
  int idCliente;
  String celular;
  double vlAReceber;
  double vlRecibido;
  String situacao;
  int idContaReceber;
  int cdContaReceber;
  int qtdParcelas;
  int qtdParcelasPagas;
  String dtPagamento;
  String endereco;
  String descricao;
  int diasVencido;
  String tipoContato;

  _AppCobroDetalheContaReceberDtoBase(
      {this.cliente,
      this.idCliente,
      this.celular,
      this.vlAReceber,
      this.vlRecibido,
      this.situacao,
      this.idContaReceber,
      this.cdContaReceber,
      this.qtdParcelas,
      this.qtdParcelasPagas,
      this.dtPagamento,
      this.endereco,
      this.descricao,
      this.tipoContato,
      this.diasVencido});

  _AppCobroDetalheContaReceberDtoBase.fromJson(Map<String, dynamic> json) {
    cliente = json['cliente'];
    idCliente = json['idCliente'];
    celular = json['celular'];
    vlAReceber = json['vlAReceber'];
    vlRecibido = json['vlRecibido'];
    situacao = json['situacao'];
    idContaReceber = json['idContaReceber'];
    cdContaReceber = json['cdContaReceber'];
    qtdParcelas = json['qtdParcelas'];
    qtdParcelasPagas = json['qtdParcelasPagas'];
    dtPagamento = json['dtPagamento'];
    descricao = json['descricao'];
    endereco = json['endereco'];
    tipoContato = json['tipoContato'];
    diasVencido = json['diasVencido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cliente'] = this.cliente;
    data['idCliente'] = this.idCliente;
    data['celular'] = this.celular;
    data['vlAReceber'] = this.vlAReceber;
    data['vlRecibido'] = this.vlRecibido;
    data['situacao'] = this.situacao;
    data['idContaReceber'] = this.idContaReceber;
    data['cdContaReceber'] = this.cdContaReceber;
    data['qtdParcelas'] = this.qtdParcelas;
    data['qtdParcelasPagas'] = this.qtdParcelasPagas;
    data['dtPagamento'] = this.dtPagamento;
    data['descricao'] = this.descricao;
    data['endereco'] = this.endereco;
    data['tipoContato'] = this.tipoContato;
    data['diasVencido'] = this.diasVencido;
    return data;
  }

  bool telefoneValido() {
    if (celular == null) return false;
    if (celular.isEmpty) return false;
    return true;
  }

  String telefonoFormated() {
    if (celular == null) return "Telefono no registrado";
    if (celular.isEmpty) return "Telefono no registrado";
    return celular;
  }
}
