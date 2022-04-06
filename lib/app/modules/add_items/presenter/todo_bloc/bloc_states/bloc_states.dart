import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';

abstract class BlocState {}

class InitialBlocState extends BlocState {}

class SuccessBlocState extends BlocState {
  final List<ItemEntity> items;

  SuccessBlocState(this.items);
}

class LoadingBlocState extends BlocState {}

class ErrorBlocState extends BlocState {
  final String message;

  ErrorBlocState(this.message);
}
