import '../../../domain/entities/item_entity.dart';

abstract class ItemBlocState {}

class InitialBlocState extends ItemBlocState {}

class SuccessBlocState extends ItemBlocState {
  final List<ItemEntity> items;

  SuccessBlocState(this.items);
}

class LoadingBlocState extends ItemBlocState {}

class ErrorBlocState extends ItemBlocState {
  final String message;

  ErrorBlocState(this.message);
}
