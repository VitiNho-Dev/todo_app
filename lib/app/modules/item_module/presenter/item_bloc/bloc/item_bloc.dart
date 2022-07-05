import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/add_item_usecase.dart';
import '../../../domain/usecases/delete_item_usecase.dart';
import '../../../domain/usecases/get_item_usecase.dart';
import '../../../domain/usecases/update_item_usecase.dart';
import '../bloc_events/item_bloc_events.dart';
import '../bloc_states/bloc_states.dart';

class ItemBloc extends Bloc<ItemBlocEvent, ItemBlocState>
    implements Disposable {
  late StreamSubscription streamSubscription;
  final AddItemUsecase addItemUsecase;
  final DeleteItemUsecase deleteItemUsecase;
  final GetItemUsecase getItemUsecase;
  final UpdateItemUsecase updateItemUsecase;

  void initState() {
    getItemUsecase().fold(
      (l) => ErrorBlocState(l.toString()),
      (r) {
        streamSubscription = r.listen((event) {
          add(RefreshItemBlocEvent(event));
        });
      },
    );
  }

  ItemBloc(
    this.addItemUsecase,
    this.deleteItemUsecase,
    this.getItemUsecase,
    this.updateItemUsecase,
  ) : super(InitialBlocState()) {
    on<RefreshItemBlocEvent>(
      (event, emit) {
        if (event.listItemEntity.isEmpty) {
          return emit(InitialBlocState());
        }
        emit(SuccessBlocState(event.listItemEntity));
      },
    );

    on<AddItemBlocEvent>(
      (event, emit) async {
        emit(LoadingBlocState());
        final result = await addItemUsecase(event.itemEntity);
        result.fold(
          (l) => emit(ErrorBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<UpdateItemBlocEvent>(
      (event, emit) async {
        final result = await updateItemUsecase(event.itemEntity);
        result.fold(
          (l) => emit(ErrorBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<DeleteItemBlocEvent>(
      (event, emit) async {
        final result = await deleteItemUsecase(event.itemEntity);
        result.fold(
          (l) => emit(ErrorBlocState('Falhou')),
          (r) => r,
        );
      },
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
  }
}
