import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';

abstract class ListBlocEvents {}

class GetListBlocEvents extends ListBlocEvents {}

class RefreshListBlocEvents extends ListBlocEvents {
  final List<ListEntity> listEntity;

  RefreshListBlocEvents(this.listEntity);
}

class AddListBlocEvents extends ListBlocEvents {
  final ListEntity listEntity;

  AddListBlocEvents(this.listEntity);
}

class UpdateListBlocEvents extends ListBlocEvents {
  final ListEntity listEntity;

  UpdateListBlocEvents(this.listEntity);
}

class DeleteListBlocEvents extends ListBlocEvents {
  final ListEntity listEntity;

  DeleteListBlocEvents(this.listEntity);
}
