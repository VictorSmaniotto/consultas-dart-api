class Produto {
  int codigo;
  String nome;
  double preco;
  DateTime dataAlteracao;

  Produto({
    required this.codigo,
    required this.nome,
    required this.preco,
    required this.dataAlteracao,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        codigo: json['codigo'],
        nome: json['nome'],
        preco: json['preco'],
        dataAlteracao: DateTime.parse(json['dataAlteracao']));
  }
}

void main() {
  Produto produto = Produto(
      codigo: 1,
      nome: 'X-TUDO',
      preco: 40.50,
      dataAlteracao: DateTime(2023, 6, 27));

  print("Produto:\n"
      "Código: ${produto.codigo}\n"
      "Nome: ${produto.nome}\n"
      "Preço: ${produto.preco}\n"
      "Alteração: ${produto.dataAlteracao}\n");
}
