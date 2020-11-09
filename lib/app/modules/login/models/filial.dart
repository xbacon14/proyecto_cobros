class Filial {
  int id;
  int codigo;
  String descricao;
  String ruc;
  String cidade;
  String endereco;
  bool ativo;
  String atividadeEconomica;
  String principal;
  String empresa;

  Filial(
      {this.id,
      this.codigo,
      this.descricao,
      this.ruc,
      this.cidade,
      this.endereco,
      this.ativo,
      this.atividadeEconomica,
      this.principal,
      this.empresa});

  Filial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    descricao = json['descricao'];
    ruc = json['ruc'];
    cidade = json['cidade'];
    endereco = json['endereco'];
    ativo = json['ativo'];
    atividadeEconomica = json['atividadeEconomica'];
    principal = json['principal'];
    empresa = json['empresa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['descricao'] = this.descricao;
    data['ruc'] = this.ruc;
    data['cidade'] = this.cidade;
    data['endereco'] = this.endereco;
    data['ativo'] = this.ativo;
    data['atividadeEconomica'] = this.atividadeEconomica;
    data['principal'] = this.principal;
    data['empresa'] = this.empresa;
    return data;
  }
}
