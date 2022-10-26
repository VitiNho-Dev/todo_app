import 'package:app_todo/app/modules/item_module/domain/repositories/item_repositories/add_item_repository.dart';
import 'package:app_todo/app/modules/item_module/infra/datasources/add_item_datasource.dart';
import 'package:app_todo/app/modules/item_module/infra/repositories/add_item_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddItemDatasourceMock extends Mock implements AddItemDatasource {}

void main() {
  late AddItemDatasource addItemDatasource;
  late AddItemRepository addItemRepository;

  setUpAll(() async {
    addItemDatasource = AddItemDatasourceMock();
    addItemRepository = AddItemRepositoryImpl(addItemDatasource);
  });

  group('Add Item Repository test', () {
    test('[Repository] - Deve Adiconar um item ', () {});
  });
}
