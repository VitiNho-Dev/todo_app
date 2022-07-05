import '../../domain/entities/item_entity.dart';

abstract class GetItemDatasource {
  Stream<List<ItemEntity>> getItems();
}
