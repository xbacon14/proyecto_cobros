class MoedaRecebimento {
  int id;
  Null descricao;

  MoedaRecebimento({this.id, this.descricao});

  MoedaRecebimento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }
}
