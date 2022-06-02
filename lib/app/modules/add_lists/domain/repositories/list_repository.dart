import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ListRepository {
  // GET
  /// Deve trazer as listas ou uma mensagem de erro
  Either<Failures, Stream<List<ListEntity>>> getList();

  // ADD
  /// Deve enviar uma lista ou retornar uma mensagem de erro
  Future<Either<Failures, Unit>> addList(ListEntity listEntity);

  // UPDATE
  /// Deve atualizar uma lista ou retornar uma mensagem de erro
  Future<Either<Failures, Unit>> updateList(ListEntity listEntity);

  // DELETE
  /// Deve deletar uma lista ou retornar uma mensagem de erro
  Future<Either<Failures, Unit>> deleteList(ListEntity listEntity);
}