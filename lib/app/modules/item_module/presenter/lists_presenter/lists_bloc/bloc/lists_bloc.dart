import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/usecases/lists_usecases/get_lists_usecase.dart';
import '../bloc_events/lists_bloc_events.dart';
import '../bloc_states/lists_bloc_states.dart';

class ListsBloc extends Bloc<ListsBlocEvent, ListsBlocState>
    implements Disposable {
  late StreamSubscription streamSubscription;
  // final AddItemUsecase addItemUsecase;
  // final DeleteItemUsecase deleteItemUsecase;
  final GetListsUsecase getListsUsecase;
  // final UpdateItemUsecase updateItemUsecase;

  void initState() {
    getListsUsecase().fold(
      (l) => ListsErrorBlocState(l.toString()),
      (r) {
        streamSubscription = r.listen((event) {
          add(RefreshListsBlocEvent(event));
        });
      },
    );
  }

  ListsBloc(
    // this.addItemUsecase,
    // this.deleteItemUsecase,
    this.getListsUsecase,
    // this.updateItemUsecase,
  ) : super(ListsInitialBlocState()) {
    on<RefreshListsBlocEvent>(
      (event, emit) {
        if (event.listItems.isEmpty) {
          return emit(ListsInitialBlocState());
        }
        emit(ListsSuccessBlocState(event.listItems));
      },
    );

    //   on<AddListsBlocEvent>(
    //     (event, emit) async {
    //       emit(LoadingBlocState());
    //       final result = await addItemUsecase(event.item);
    //       result.fold(
    //         (l) => emit(ErrorBlocState('Falhou')),
    //         (r) => r,
    //       );
    //     },
    //   );

    //   on<UpdateItemBlocEvent>(
    //     (event, emit) async {
    //       final result = await updateItemUsecase(event.item);
    //       result.fold(
    //         (l) => emit(ErrorBlocState('Falhou')),
    //         (r) => r,
    //       );
    //     },
    //   );

    //   on<DeleteItemBlocEvent>(
    //     (event, emit) async {
    //       final result = await deleteItemUsecase(event.item);
    //       result.fold(
    //         (l) => emit(ErrorBlocState('Falhou')),
    //         (r) => r,
    //       );
    //     },
    //   );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
  }
}
