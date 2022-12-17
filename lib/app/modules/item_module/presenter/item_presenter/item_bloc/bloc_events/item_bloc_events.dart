import '../../../../domain/entities/item_entity.dart';

abstract class ItemBlocEvent {}

class RefreshItemBlocEvent extends ItemBlocEvent {
  final List<Item> listItem;
  final String idList;

  RefreshItemBlocEvent(this.listItem, this.idList);
}

class AddItemBlocEvent extends ItemBlocEvent {
  final Item item;
  final String idList;

  AddItemBlocEvent(this.item, this.idList);
}

class UpdateItemBlocEvent extends ItemBlocEvent {
  final Item item;

  UpdateItemBlocEvent(this.item);
}

class DeleteItemBlocEvent extends ItemBlocEvent {
  final Item item;
  final String idList;

  DeleteItemBlocEvent(this.item, this.idList);
}
