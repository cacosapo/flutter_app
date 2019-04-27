class ItemList {
  final List<Item> items;

  ItemList({
    this.items,
  });

  factory ItemList.fromJson(List<dynamic> parsedJson) {
    List<Item> items = new List<Item>();

    items = parsedJson.map((i) => Item.fromJson(i)).toList();

    return new ItemList(
      items: items,
    );
  }
}

class Item {
  final String author;
  final String quote;

  Item({this.author, this.quote});

  @override
  String toString() => "author - " + this.author + "quote - " + this.quote;

  factory Item.fromJson(Map<String, dynamic> json) {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    Item temp = Item(
        author: json['dataFimSancao'], quote: json['dataTransitadoJulgado']);
    print(temp.toString());
    return temp;
  }
}

class CartaoList {
  final List<Cartao> items;

  CartaoList({
    this.items,
  });

  factory CartaoList.fromJson(List<dynamic> parsedJson) {
    List<Cartao> items = new List<Cartao>();

    items = parsedJson.map((i) => Cartao.fromJson(i)).toList();

    return new CartaoList(
      items: items,
    );
  }
}

class Cartao {
  final int id;
  final String mesExtrato;
  final String valorTransacao;
  final String dataTransacao;
  final int tipoCartaoId;
  final String tipoCartaoDescricao;

  Cartao(
      {this.id,
      this.mesExtrato,
      this.dataTransacao,
      this.tipoCartaoId,
      this.tipoCartaoDescricao,
      this.valorTransacao});

  factory Cartao.fromJson(Map<String, dynamic> json) {
    return new Cartao(
        id: json['id'],
        mesExtrato: json['mesExtrato'],
        valorTransacao: json['valorTransacao'],
        dataTransacao: json['dataTransacao'],
        tipoCartaoId: json['tipoCartao']['id'],
        tipoCartaoDescricao: json['tipoCartao']['descricao']);
  }
}
