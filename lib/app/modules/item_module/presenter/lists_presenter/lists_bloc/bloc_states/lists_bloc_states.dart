import '../../../../domain/entities/item_entity.dart';
import '../../../../domain/entities/list_entity.dart';

abstract class ListsBlocState {}

class ListsInitialBlocState extends ListsBlocState {}

class ListsSuccessBlocState extends ListsBlocState {
  final List<ListItems> listItems;

  ListsSuccessBlocState(this.listItems);
}

class ListsLoadingBlocState extends ListsBlocState {}

class ListsErrorBlocState extends ListsBlocState {
  final String message;

  ListsErrorBlocState(this.message);
}
