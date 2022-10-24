import 'package:app_todo/app/modules/item_module/domain/repositories/add_item_repository.dart';
import 'package:app_todo/app/modules/item_module/infra/datasources/add_item_datasource.dart';
import 'package:app_todo/app/modules/item_module/infra/repositories/add_item_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddItemDatasourceMock extends Mock implements AddItemDatasource {}

void main() {
  late AddItemDatasource _addItemDatasource;
  late AddItemRepository _addItemRepository;

  setUpAll(() async {
    _addItemDatasource = AddItemDatasourceMock();
    _addItemRepository = AddItemRepositoryImpl(_addItemDatasource);
  });

  group('Add Item Repository test', () {
    test('[Repository] - Deve Adiconar um item ', () {});
  });
}
