import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:transparencia/models/model.dart';


@immutable
abstract class ItemsEvent extends Equatable {
  ItemsEvent([List props = const []]) : super(props);
}

class LoadItems extends ItemsEvent {
  @override
  String toString() => 'LoadItems';
}

class AddItem extends ItemsEvent {
  final Cartao Item;

  AddItem(this.Item) : super([Item]);

  @override
  String toString() => 'AddItem { Item: $Item }';
}

class UpdateItem extends ItemsEvent {
  final Item updatedItem;

  UpdateItem(this.updatedItem) : super([updatedItem]);

  @override
  String toString() => 'UpdateItem { updatedItem: $updatedItem }';
}

class DeleteItem extends ItemsEvent {
  final Cartao Item;

  DeleteItem(this.Item) : super([Item]);

  @override
  String toString() => 'DeleteItem { Item: $Item }';
}

class ClearCompleted extends ItemsEvent {
  @override
  String toString() => 'ClearCompleted';
}

class ToggleAll extends ItemsEvent {
  @override
  String toString() => 'ToggleAll';
}