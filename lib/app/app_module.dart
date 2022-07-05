import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/item_module/domain/repositories/add_item_repository.dart';
import 'modules/item_module/domain/repositories/delete_item_repository.dart';
import 'modules/item_module/domain/repositories/get_item_repository.dart';
import 'modules/item_module/domain/repositories/update_item_repository.dart';
import 'modules/item_module/domain/usecases/add_item_usecase.dart';
import 'modules/item_module/domain/usecases/delete_item_usecase.dart';
import 'modules/item_module/domain/usecases/get_item_usecase.dart';
import 'modules/item_module/domain/usecases/update_item_usecase.dart';
import 'modules/item_module/external/datasources/add_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/delete_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/get_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/update_item_datasource_impl.dart';
import 'modules/item_module/infra/datasources/add_item_datasource.dart';
import 'modules/item_module/infra/datasources/delete_item_datasource.dart';
import 'modules/item_module/infra/datasources/get_item_datasource.dart';
import 'modules/item_module/infra/datasources/update_item_datasource.dart';
import 'modules/item_module/infra/repositories/add_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/delete_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/get_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/update_item_repository_impl.dart';
import 'modules/item_module/presenter/item_bloc/bloc/item_bloc.dart';
import 'modules/item_module/presenter/page_todo/page_todo.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        Bind.factory<AddItemDatasource>(
          (i) => AddItemDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<DeleteItemDatasource>(
          (i) => DeleteItemDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<GetItemDatasource>(
          (i) => GetItemDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<UpdateItemDatasource>(
          (i) => UpdateItemDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<AddItemRepository>(
          (i) => AddItemRepositoryImpl(i<AddItemDatasource>()),
        ),
        Bind.factory<DeleteItemRepository>(
          (i) => DeleteItemRepositoryImpl(i<DeleteItemDatasource>()),
        ),
        Bind.factory<GetItemRepository>(
          (i) => GetItemRepositoryImpl(i<GetItemDatasource>()),
        ),
        Bind.factory<UpdateItemRepository>(
          (i) => UpdateItemRepositoryImpl(i<UpdateItemDatasource>()),
        ),
        Bind.factory<AddItemUsecase>(
          (i) => AddItemUsecaseImpl(i<AddItemRepository>()),
        ),
        Bind.factory<DeleteItemUsecase>(
          (i) => DeleteItemUsecaseImpl(i<DeleteItemRepository>()),
        ),
        Bind.factory<GetItemUsecase>(
          (i) => GetItemUsecaseImpl(i<GetItemRepository>()),
        ),
        Bind.factory<UpdateItemUsecase>(
          (i) => UpdateItemUsecaseImpl(i<UpdateItemRepository>()),
        ),
        Bind.factory(
          (i) => ItemBloc(
            i<AddItemUsecase>(),
            i<DeleteItemUsecase>(),
            i<GetItemUsecase>(),
            i<UpdateItemUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const PageTodo(),
        ),
      ];
}
