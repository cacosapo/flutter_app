class ItemList {
  final List<Item> items;

  ItemList({
    this.items,
  });

  factory ItemList.fromJson(List<dynamic> parsedJson) {
    List<Item> items = new List<Item>();

    items = parsedJson.map((i)=> Item.fromJson(i)).toList();

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
