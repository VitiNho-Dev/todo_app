import 'dart:async';

import 'package:app_todo/app/modules/add_lists/domain/usecases/add_list_usecase.dart';
import 'package:app_todo/app/modules/add_lists/domain/usecases/delete_list_usecase.dart';
import 'package:app_todo/app/modules/add_lists/domain/usecases/get_list_usecase.dart';
import 'package:app_todo/app/modules/add_lists/domain/usecases/update_list_usecase.dart';
import 'package:app_todo/app/modules/add_lists/presenter/list_bloc/bloc_events/list_bloc_events.dart';
import 'package:app_todo/app/modules/add_lists/presenter/list_bloc/list_bloc_states/list_bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListBloc extends Bloc<ListBlocEvents, ListBlocState>
    implements Disposable {
  late StreamSubscription _streamSubscription;
  final GetListUsecase _getListUsecase;
  final AddListUsecase _addListUsecase;
  final UpdateListUsecase _updateListUsecase;
  final DeleteListUsecase _deleteListUsecase;

  void initState() {
    _getListUsecase().fold((l) => ErrorListBlocState('Aconteceu um erro'), (r) {
      _streamSubscription = r.listen((lists) {
        add(RefreshListBlocEvents(lists));
      });
    });
  }

  ListBloc(
    ListBlocState initialState,
    this._getListUsecase,
    this._addListUsecase,
    this._updateListUsecase,
    this._deleteListUsecase,
  ) : super(InitialListBlocState()) {
    on<RefreshListBlocEvents>(
      (event, emit) {
        if (event.listEntity.isEmpty) {
          return emit(InitialListBlocState());
        }
        emit(SuccessListBlocState(event.listEntity));
      },
    );

    on<AddListBlocEvents>(
      (event, emit) async {
        final _result = await _addListUsecase(event.listEntity);
        _result.fold(
          (l) => emit(ErrorListBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<UpdateListBlocEvents>(
      (event, emit) async {
        final _result = await _updateListUsecase(event.listEntity);
        _result.fold(
          (l) => emit(ErrorListBlocState('Falhou')),
          (r) => r,
        );
      },
    );

    on<DeleteListBlocEvents>(
      (event, emit) async {
        final _result = await _deleteListUsecase(event.listEntity);
        _result.fold(
          (l) => emit(ErrorListBlocState('Falhou')),
          (r) => r,
        );
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
  }
}
