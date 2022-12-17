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

class DeleteListBlocEvent extends ListsBlocEvent {
  final ListItems listItems;

  DeleteListBlocEvent(this.listItems);
}
