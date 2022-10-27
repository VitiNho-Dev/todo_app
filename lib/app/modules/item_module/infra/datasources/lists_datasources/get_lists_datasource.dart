import '../../../domain/entities/list_entity.dart';

abstract class GetListsDatasource {
  Stream<List<ListItems>> getLists();
}
