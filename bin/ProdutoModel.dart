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
        nome: json['descricao'],
        preco: json['valor'],
        dataAlteracao: DateTime.parse(json['dataAlteracao']));
  }
}

void main() {
  // Produto produto = Produto(
  //     codigo: 1,
  //     nome: 'X-TUDO',
  //     preco: 40.50,
  //     dataAlteracao: DateTime(2023, 6, 27));

  // print("Produto:\n"
  //     "Código: ${produto.codigo}\n"
  //     "Nome: ${produto.nome}\n"
  //     "Preço: ${produto.preco}\n"
  //     "Alteração: ${produto.dataAlteracao}\n");

  Map<String, dynamic> json = {
    "codigo": 2,
    "descricao": "X-Bacon",
    "valor": 19.90,
    "dataAlteracao": "2023-06-27 22:01"
  };

  Produto produto = Produto.fromJson(json);

  print("Produto:\n"
      "Código: ${produto.codigo}\n"
      "Nome: ${produto.nome}\n"
      "Preço: ${produto.preco}\n"
      "Alteração: ${produto.dataAlteracao}\n");
}
