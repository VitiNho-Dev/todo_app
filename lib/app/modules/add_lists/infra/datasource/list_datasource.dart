import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ListDatasource {
  // GET
  /// Deve trazer as listas do banco de dados
  Stream<List<ListEntity>> getLists();

  // ADD
  /// Deve adicionar uma lista no banco de dados
  Future<Unit> addList(ListEntity listEntity);

  // UPDATE
  /// Deve atualizar uma lista do banco de dados
  Future<Unit> updateList(ListEntity listEntity);

  // DELETE
  /// Deve deletar uma lista do banco de dados
  Future<Unit> deleteList(ListEntity listEntity);
}