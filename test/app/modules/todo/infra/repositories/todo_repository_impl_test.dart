import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/infra/data_suorces/todo_data_source.dart';
import 'package:app_todo/app/modules/add_items/infra/repositories/todo_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/list_items.dart';

class DataSourceMock extends Mock implements TodoDataSource {}

void main() {
  final dataSource = DataSourceMock();
  final repository = TodoRepositoryImpl(dataSource);

  test('Deve retornar uma stream list items', () async* {
    when(() => dataSource.getItems()).thenAnswer((_) async* {
      listStream;
    });

    final result = repository.getItem();
    expect(result.fold(id, id), isA<List<Item>>());
  });
}
