import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';

abstract class ListBlocState {}

class InitialListBlocState extends ListBlocState {}

class SuccessListBlocState extends ListBlocState {
  final List<ListEntity> lists;

  SuccessListBlocState(this.lists);
}

class LoadingListBlocState extends ListBlocState {}

class ErrorListBlocState extends ListBlocState {
  final String message;

  ErrorListBlocState(this.message);
}
