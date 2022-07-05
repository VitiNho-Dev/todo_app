import '../../../domain/entities/item_entity.dart';

abstract class ItemBlocEvent {}

class GetItemBlocEvent extends ItemBlocEvent {}

class RefreshItemBlocEvent extends ItemBlocEvent {
  final List<ItemEntity> listItemEntity;

  RefreshItemBlocEvent(this.listItemEntity);
}

class AddItemBlocEvent extends ItemBlocEvent {
  final ItemEntity itemEntity;

  AddItemBlocEvent(this.itemEntity);
}

class UpdateItemBlocEvent extends ItemBlocEvent {
  final ItemEntity itemEntity;

  UpdateItemBlocEvent(this.itemEntity);
}

class DeleteItemBlocEvent extends ItemBlocEvent {
  final ItemEntity itemEntity;

  DeleteItemBlocEvent(this.itemEntity);
}
