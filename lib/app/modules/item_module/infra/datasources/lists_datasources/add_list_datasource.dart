import 'package:dartz/dartz.dart';
import '../../../domain/entities/list_entity.dart';

abstract class AddListDatasource {
  Future<Unit> addLists(ListItems listItems);
}
