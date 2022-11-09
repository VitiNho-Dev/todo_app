import '../../../../domain/entities/list_entity.dart';

abstract class ListsBlocEvent {}

class RefreshListsBlocEvent extends ListsBlocEvent {
  final List<ListItems> listItems;

  RefreshListsBlocEvent(this.listItems);
}

class AddListsBlocEvent extends ListsBlocEvent {
  final ListItems listItems;

  AddListsBlocEvent(this.listItems);
}

class UpdateListsBlocEvent extends ListsBlocEvent {
  final ListItems listItems;

  UpdateListsBlocEvent(this.listItems);
}

class DeleteListsBlocEvent extends ListsBlocEvent {
  final ListItems listItems;

  DeleteListsBlocEvent(this.listItems);
}
