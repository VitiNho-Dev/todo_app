// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';

import '../../../domain/entities/item_entity.dart';

abstract class UpdateItemDatasource {
  Future<Unit> updateItem(Item item);
}
