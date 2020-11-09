import 'package:intl/intl.dart';

class TimeLineHistoricoCobroDto {
  String descricao;
  String dtHistorico;
  String dataPosivelCobro;
  bool pago;
  String usuario;
  String tipoContato;

  TimeLineHistoricoCobroDto(
      {this.descricao,
      this.dtHistorico,
      this.dataPosivelCobro,
      this.pago,
      this.usuario,
      this.tipoContato});

  TimeLineHistoricoCobroDto.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    dtHistorico = json['dtHistorico'];
    dataPosivelCobro = json['dataPosivelCobro'];
    pago = json['pago'];
    usuario = json['usuario'];
    tipoContato = json['tipoContato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['dtHistorico'] = this.dtHistorico;
    data['dataPosivelCobro'] = this.dataPosivelCobro;
    data['pago'] = this.pago;
    data['usuario'] = this.usuario;
    data['tipoContato'] = this.tipoContato;
    return data;
  }

  String dtHistoricoFormate() {
    return new DateFormat('dd/MM/yyyy').format(DateTime.parse(dtHistorico));
  }
}
