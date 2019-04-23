
class ItemList {
  final List<Item> items;

  ItemList({
    this.items,
  });

  factory ItemList.fromJson(List<dynamic> parsedJson) {

    List<Item> items = new List<Item>();

    return new ItemList(
       items: items,
    );
  }
}

class Item {
  final String author;
  final String quote;

  Item({this.author, this.quote});

  factory Item.fromJson(Map<String, dynamic> json) {
    print(json);
    return Item(
        author: json['id'],
        quote: json['dataReferencia']);
  }
}