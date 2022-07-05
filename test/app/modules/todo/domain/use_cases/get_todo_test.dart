import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:app_todo/app/modules/add_items/domain/usecases/get_item_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/list_items.dart';

class RepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repositoryMock = RepositoryMock();
  final getTodo = GetTodoImpl(repositoryMock);

  test('Deve retornar uma Lista de Items', () async* {
    when(() => repositoryMock.getItem()).thenAnswer((_) => Right(listStream));
    final result = getTodo();
    expect(result.fold(id, id), isA<List<ItemEntity>>());
  });
}
