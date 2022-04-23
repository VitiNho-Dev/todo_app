import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_items/domain/repositories/todos_repository.dart';
import 'package:app_todo/app/modules/add_items/infra/data_suorces/todo_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSuorce;

  TodoRepositoryImpl(this._dataSuorce);

  @override
  Either<Failures, Stream<List<ItemEntity>>> getItem() {
    try {
      var result = _dataSuorce.getItems();
      return Right(result);
    } on Failures catch (e) {
      return Left(e);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(InvalidError());
    }
  }

  @override
  Future<Either<Failures, Unit>> addItem(ItemEntity itemEntity) async {
    try {
      await _dataSuorce.addItem(itemEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failures, Unit>> updateItem(ItemEntity itemEntity) async {
    try {
      await _dataSuorce.updateTodo(itemEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failures, Unit>> removeItem(ItemEntity itemEntity) async {
    try {
      await _dataSuorce.deleteTodo(itemEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
}
