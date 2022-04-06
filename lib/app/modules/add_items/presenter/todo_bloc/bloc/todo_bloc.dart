import 'dart:async';
import 'package:app_todo/app/modules/add_items/domain/usecases/add_todo_usecase.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/delete._todo_usecase.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/get_todo.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/update_todo.dart';
import 'package:app_todo/app/modules/add_items/presenter/todo_bloc/bloc_events/bloc_events.dart';
import 'package:app_todo/app/modules/add_items/presenter/todo_bloc/bloc_states/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoBloc extends Bloc<TodoEvent, BlocState> implements Disposable {
  late StreamSubscription streamSubscription;
  final GetTodo usecaseGetTodo;
  final IAddTodoUsecase usecaseAddTodo;
  final UpdateTodo usecaseUpdateTodo;
  final DeleteTodo usecaseDeleteTodo;

  void initState() {
    usecaseGetTodo().fold(
      (l) => ErrorBlocState('Aconteceu um erro'),
      (r) {
        streamSubscription = r.listen((event) {
          add(RefreshItemBlocEvent(event));
        });
      },
    );
  }

  TodoBloc(this.usecaseGetTodo, this.usecaseAddTodo, this.usecaseUpdateTodo,
      this.usecaseDeleteTodo)
      : super(InitialBlocState()) {
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
        final result = await usecaseAddTodo(event.itemEntity);
        result.fold(
          (l) => emit(ErrorBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<UpdateItemBlocEvent>(
      (event, emit) async {
        final result = await usecaseUpdateTodo(event.itemEntity);
        result.fold(
          (l) => emit(ErrorBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<DeleteItemBlocEvent>(
      (event, emit) async {
        final result = await usecaseDeleteTodo(event.itemEntity);
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
