class Vendedor {
  int id;
  int codigo;
  String nome;
  double comissaoVenda;
  int nivelAcesso;
  double comissaoLucro;
  double comissaoPorcentagem;
  double vlMetaVenda;
  int telefone;
  bool ativo;
  double vlVendido;

  Vendedor(
      {this.id,
      this.codigo,
      this.nome,
      this.comissaoVenda,
      this.nivelAcesso,
      this.comissaoLucro,
      this.comissaoPorcentagem,
      this.vlMetaVenda,
      this.telefone,
      this.ativo,
      this.vlVendido});

  Vendedor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigo = json['codigo'];
    nome = json['nome'];
    comissaoVenda = json['comissaoVenda'];
    nivelAcesso = json['nivelAcesso'];
    comissaoLucro = json['comissaoLucro'];
    comissaoPorcentagem = json['comissaoPorcentagem'];
    vlMetaVenda = json['vlMetaVenda'];
    telefone = json['telefone'];
    ativo = json['ativo'];
    vlVendido = json['vlVendido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigo'] = this.codigo;
    data['nome'] = this.nome;
    data['comissaoVenda'] = this.comissaoVenda;
    data['nivelAcesso'] = this.nivelAcesso;
    data['comissaoLucro'] = this.comissaoLucro;
    data['comissaoPorcentagem'] = this.comissaoPorcentagem;
    data['vlMetaVenda'] = this.vlMetaVenda;
    data['telefone'] = this.telefone;
    data['ativo'] = this.ativo;
    data['vlVendido'] = this.vlVendido;
    return data;
  }
}
