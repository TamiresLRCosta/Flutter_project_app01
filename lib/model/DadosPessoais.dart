class DadosPessoais {
  late String id;
  late String nome;
  late String cpf;
  late String email;
  late String celular;
  late String nascimento;
  late double valorParcial;
  late double limite;

  DadosPessoais(this.id, this.nome, this.cpf, this.email, this.celular,
      this.nascimento, this.valorParcial, this.limite);

  DadosPessoais.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.nome = mapa['nome'];
    this.cpf = mapa['cpf'];
    this.email = mapa['email'];
    this.celular = mapa['celular'];
    this.nascimento = mapa['nascimento'];
    this.valorParcial = mapa['valorParcial  '];
    this.limite = mapa['limite'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'cpf': this.cpf,
      'email': this.email,
      'celular': this.celular,
      'nascimento': this.nascimento,
      'valorParcial': this.valorParcial,
      'limite': this.limite,
    };
  }
}
