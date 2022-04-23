import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';

abstract class TodoEvent {}

class GetItemBlocEvent extends TodoEvent {}

class RefreshItemBlocEvent extends TodoEvent {
  final List<ItemEntity> listItemEntity;

  RefreshItemBlocEvent(this.listItemEntity);
}

class AddItemBlocEvent extends TodoEvent {
  final ItemEntity itemEntity;

  AddItemBlocEvent(this.itemEntity);
}

class UpdateItemBlocEvent extends TodoEvent {
  final ItemEntity itemEntity;

  UpdateItemBlocEvent(this.itemEntity);
}

class DeleteItemBlocEvent extends TodoEvent {
  final ItemEntity itemEntity;

  DeleteItemBlocEvent(this.itemEntity);
}
