import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/add_items/domain/errors/todo_failures.dart';
import 'package:app_todo/app/modules/add_lists/domain/repositories/list_repository.dart';
import 'package:app_todo/app/modules/add_lists/infra/datasource/list_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ListRepositoryImpl implements ListRepository {
  final ListDatasource _listDatasource;

  ListRepositoryImpl(this._listDatasource);

  @override
  Future<Either<Failures, Unit>> addList(ListEntity listEntity) async {
    try {
      await _listDatasource.addList(listEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failures, Unit>> deleteList(ListEntity listEntity) async {
    try {
      await _listDatasource.deleteList(listEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }

  @override
  Either<Failures, Stream<List<ListEntity>>> getList() {
    try {
      final _result = _listDatasource.getLists();
      return Right(_result);
    } on Failures catch (e) {
      return Left(e);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      throw Left(InvalidError());
    }
  }

  @override
  Future<Either<Failures, Unit>> updateList(ListEntity listEntity) async {
    try {
      await _listDatasource.updateList(listEntity);
      return const Right(unit);
    } on Failures catch (e) {
      return Left(e);
    }
  }
  
}