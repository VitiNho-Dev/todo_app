import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/add_todo_usecase.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/delete._todo_usecase.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/get_todo.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/update_todo.dart';

import 'package:app_todo/app/modules/add_items/external/data_sources/todo_data_source_impl.dart';
import 'package:app_todo/app/modules/add_items/infra/data_suorces/todo_data_source.dart';
import 'package:app_todo/app/modules/add_items/infra/repositories/todo_repository_impl.dart';
import 'package:app_todo/app/modules/add_items/presenter/page_todo/page_todo.dart';
import 'package:app_todo/app/modules/add_items/presenter/todo_bloc/bloc/todo_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        Bind.factory<TodoDataSource>(
            (i) => TodoDataSourceImpl(i<FirebaseFirestore>())),
        Bind.factory<TodoRepository>(
            (i) => TodoRepositoryImpl(i<TodoDataSource>())),
        Bind.factory<GetTodo>((i) => GetTodoImpl(i<TodoRepository>())),
        Bind.factory<IAddTodoUsecase>(
            (i) => AddTodoUsecase(i<TodoRepository>())),
        Bind.factory<UpdateTodo>((i) => UpdateTodoImpl(i<TodoRepository>())),
        Bind.factory<DeleteTodo>((i) => DeleteTodoImpl(i<TodoRepository>())),
        Bind.factory((i) => TodoBloc(
              i<GetTodo>(),
              i<IAddTodoUsecase>(),
              i<UpdateTodo>(),
              i<DeleteTodo>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const PageTodo(),
        ),
      ];
}
