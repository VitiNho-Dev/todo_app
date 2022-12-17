import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/item_module/domain/repositories/item_repositories/add_item_repository.dart';
import 'modules/item_module/domain/repositories/item_repositories/delete_item_repository.dart';
import 'modules/item_module/domain/repositories/item_repositories/get_item_repository.dart';
import 'modules/item_module/domain/repositories/item_repositories/update_item_repository.dart';
import 'modules/item_module/domain/repositories/lists_repositories/add_list_repository.dart';
import 'modules/item_module/domain/repositories/lists_repositories/delete_list_repository.dart';
import 'modules/item_module/domain/repositories/lists_repositories/get_lists_repository.dart';
import 'modules/item_module/domain/usecases/item_usecases/add_item_usecase.dart';
import 'modules/item_module/domain/usecases/item_usecases/delete_item_usecase.dart';
import 'modules/item_module/domain/usecases/item_usecases/get_item_usecase.dart';
import 'modules/item_module/domain/usecases/item_usecases/update_item_usecase.dart';
import 'modules/item_module/domain/usecases/lists_usecases/add_list_usecase.dart';
import 'modules/item_module/domain/usecases/lists_usecases/delete_list_usecase.dart';
import 'modules/item_module/domain/usecases/lists_usecases/get_lists_usecase.dart';
import 'modules/item_module/external/datasources/item_datasources/add_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/item_datasources/delete_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/item_datasources/get_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/item_datasources/update_item_datasource_impl.dart';
import 'modules/item_module/external/datasources/lists_datasources/add_list_datasource_impl.dart';
import 'modules/item_module/external/datasources/lists_datasources/delete_list_datasource_impl.dart';
import 'modules/item_module/external/datasources/lists_datasources/get_lists_datasource_impl.dart';
import 'modules/item_module/infra/datasources/item_datasources/add_item_datasource.dart';
import 'modules/item_module/infra/datasources/item_datasources/delete_item_datasource.dart';
import 'modules/item_module/infra/datasources/item_datasources/get_item_datasource.dart';
import 'modules/item_module/infra/datasources/item_datasources/update_item_datasource.dart';
import 'modules/item_module/infra/datasources/lists_datasources/add_list_datasource.dart';
import 'modules/item_module/infra/datasources/lists_datasources/delete_list_datasource.dart';
import 'modules/item_module/infra/datasources/lists_datasources/get_lists_datasource.dart';
import 'modules/item_module/infra/repositories/item_repositories/add_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/item_repositories/delete_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/item_repositories/get_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/item_repositories/update_item_repository_impl.dart';
import 'modules/item_module/infra/repositories/lists_repositories/add_list_repository_impl.dart';
import 'modules/item_module/infra/repositories/lists_repositories/delete_list_repository_impl.dart';
import 'modules/item_module/infra/repositories/lists_repositories/get_lists_repository_impl.dart';
import 'modules/item_module/presenter/item_presenter/item_bloc/bloc/item_bloc.dart';
import 'modules/item_module/presenter/item_presenter/page_items/page_items.dart';
import 'modules/item_module/presenter/lists_presenter/lists_bloc/bloc/lists_bloc.dart';
import 'modules/item_module/presenter/lists_presenter/page_lists/page_lists.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
        // Datasource
        /* Item Datasource */
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

        /* List Datasource */
        Bind.factory<GetListsDatasource>(
          (i) => GetListsDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<AddListDatasource>(
          (i) => AddListDatasourceImpl(i<FirebaseFirestore>()),
        ),
        Bind.factory<DeleteListDatasource>(
          (i) => DeleteListDatasourceImpl(i<FirebaseFirestore>()),
        ),

        // Repository
        /* Item Repository */
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

        /* List Repository */
        Bind.factory<GetListsRepository>(
          (i) => GetListsRepositoryImpl(i<GetListsDatasource>()),
        ),
        Bind.factory<AddListRepository>(
          (i) => AddListRepositoryImpl(i<AddListDatasource>()),
        ),
        Bind.factory<DeleteListRepository>(
          (i) => DeleteListRepositoryImpl(i<DeleteListDatasource>()),
        ),

        // Usecase
        /* Item Usecase */
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

        /* List Usecase */
        Bind.factory<GetListsUsecase>(
          (i) => GetListsUsecaseImpl(i<GetListsRepository>()),
        ),
        Bind.factory<AddListUsecase>(
          (i) => AddListUsecaseImpl(i<AddListRepository>()),
        ),
        Bind.factory<DeleteListUsecase>(
          (i) => DeleteListUsecaseImpl(i<DeleteListRepository>()),
        ),

        // Bloc
        /* Item Bloc */
        Bind.factory(
          (i) => ItemBloc(
            i<AddItemUsecase>(),
            i<DeleteItemUsecase>(),
            i<GetItemUsecase>(),
            i<UpdateItemUsecase>(),
          ),
        ),

        /* List Bloc */
        Bind.factory(
          (i) => ListsBloc(
            i<AddListUsecase>(),
            i<DeleteListUsecase>(),
            i<GetListsUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const PageLists(),
        ),
        ChildRoute(
          '/Items',
          child: (context, args) => PageItems(idList: args.data),
        ),
      ];
}
