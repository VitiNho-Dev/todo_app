// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';

import '../../modules/item_module/domain/entities/item_entity.dart';

abstract class ServiceAddItem {
  Future<Unit> addItem(Item item);
}
