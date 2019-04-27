import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:transparencia/models/model.dart';

@immutable
abstract class ItemState extends Equatable {
  ItemState([List props = const []]) : super(props);
}

class ItemLoading extends ItemState {
  @override
  String toString() => 'ItemLoading';
}

class ItemLoaded extends ItemState {
  final List<Cartao> Item;

  ItemLoaded([this.Item = const []]) : super([Item]);

  @override
  String toString() => 'ItemLoaded { Item: $Item }';
}

class ItemNotLoaded extends ItemState {
  @override
  String toString() => 'ItemNotLoaded';
}