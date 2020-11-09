class Cliente {
  int id;
  String nome;
  String celular;
  String telefone;
  String endereco;
  String ruc;
  String tipo;
  double vlCredito;
  double vlLimiteCredito;
  bool faturavel;
  bool ativo;
  bool extrangeiro;
  double longitude;
  double latitude;
  String dtVencimentoContaReceber;
  String localTrabalho;
  String comentario;
  String dtNacimento;
  String email;
  String codeudor;
  String codeudorDois;
  String cobrador;
  String conyuge;
  String estadoCivil;
  String referenciaPessoal1;
  String telefoneReferenciaPessoal1;
  String referenciaPessoal2;
  String telefoneReferenciaPessoal2;
  String referenciaPessoal3;
  String telefoneReferenciaPessoal3;
  String cidade;
  String vendedor;
  String operacaoVenda;

  Cliente(
      {this.id,
      this.nome,
      this.celular,
      this.telefone,
      this.endereco,
      this.ruc,
      this.tipo,
      this.vlCredito,
      this.vlLimiteCredito,
      this.faturavel,
      this.ativo,
      this.extrangeiro,
      this.longitude,
      this.latitude,
      this.dtVencimentoContaReceber,
      this.localTrabalho,
      this.comentario,
      this.dtNacimento,
      this.email,
      this.codeudor,
      this.codeudorDois,
      this.cobrador,
      this.conyuge,
      this.estadoCivil,
      this.referenciaPessoal1,
      this.telefoneReferenciaPessoal1,
      this.referenciaPessoal2,
      this.telefoneReferenciaPessoal2,
      this.referenciaPessoal3,
      this.telefoneReferenciaPessoal3,
      this.cidade,
      this.vendedor,
      this.operacaoVenda});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    celular = json['celular'];
    telefone = json['telefone'];
    endereco = json['endereco'];
    ruc = json['ruc'];
    tipo = json['tipo'];
    vlCredito = json['vlCredito'];
    vlLimiteCredito = json['vlLimiteCredito'];
    faturavel = json['faturavel'];
    ativo = json['ativo'];
    extrangeiro = json['extrangeiro'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    dtVencimentoContaReceber = json['dtVencimentoContaReceber'];
    localTrabalho = json['localTrabalho'];
    comentario = json['comentario'];
    dtNacimento = json['dtNacimento'];
    email = json['email'];
    codeudor = json['codeudor'];
    codeudorDois = json['codeudorDois'];
    cobrador = json['cobrador'];
    conyuge = json['conyuge'];
    estadoCivil = json['estadoCivil'];
    referenciaPessoal1 = json['referenciaPessoal1'];
    telefoneReferenciaPessoal1 = json['telefoneReferenciaPessoal1'];
    referenciaPessoal2 = json['referenciaPessoal2'];
    telefoneReferenciaPessoal2 = json['telefoneReferenciaPessoal2'];
    referenciaPessoal3 = json['referenciaPessoal3'];
    telefoneReferenciaPessoal3 = json['telefoneReferenciaPessoal3'];
    cidade = json['cidade'];
    vendedor = json['vendedor'];
    operacaoVenda = json['operacaoVenda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['celular'] = this.celular;
    data['telefone'] = this.telefone;
    data['endereco'] = this.endereco;
    data['ruc'] = this.ruc;
    data['tipo'] = this.tipo;
    data['vlCredito'] = this.vlCredito;
    data['vlLimiteCredito'] = this.vlLimiteCredito;
    data['faturavel'] = this.faturavel;
    data['ativo'] = this.ativo;
    data['extrangeiro'] = this.extrangeiro;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['dtVencimentoContaReceber'] = this.dtVencimentoContaReceber;
    data['localTrabalho'] = this.localTrabalho;
    data['comentario'] = this.comentario;
    data['dtNacimento'] = this.dtNacimento;
    data['email'] = this.email;
    data['codeudor'] = this.codeudor;
    data['codeudorDois'] = this.codeudorDois;
    data['cobrador'] = this.cobrador;
    data['conyuge'] = this.conyuge;
    data['estadoCivil'] = this.estadoCivil;
    data['referenciaPessoal1'] = this.referenciaPessoal1;
    data['telefoneReferenciaPessoal1'] = this.telefoneReferenciaPessoal1;
    data['referenciaPessoal2'] = this.referenciaPessoal2;
    data['telefoneReferenciaPessoal2'] = this.telefoneReferenciaPessoal2;
    data['referenciaPessoal3'] = this.referenciaPessoal3;
    data['telefoneReferenciaPessoal3'] = this.telefoneReferenciaPessoal3;
    data['cidade'] = this.cidade;
    data['vendedor'] = this.vendedor;
    data['operacaoVenda'] = this.operacaoVenda;
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
