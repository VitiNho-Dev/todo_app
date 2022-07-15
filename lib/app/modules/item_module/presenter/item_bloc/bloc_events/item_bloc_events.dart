import '../../../domain/entities/item_entity.dart';

abstract class ItemBlocEvent {}

class RefreshItemBlocEvent extends ItemBlocEvent {
  final List<Item> listItem;

  RefreshItemBlocEvent(this.listItem);
}

class AddItemBlocEvent extends ItemBlocEvent {
  final Item item;

  AddItemBlocEvent(this.item);
}

class UpdateItemBlocEvent extends ItemBlocEvent {
  final Item item;

  UpdateItemBlocEvent(this.item);
}

class DeleteItemBlocEvent extends ItemBlocEvent {
  final Item item;

  DeleteItemBlocEvent(this.item);
}
