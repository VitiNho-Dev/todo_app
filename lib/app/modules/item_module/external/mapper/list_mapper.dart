import 'package:app_todo/app/modules/item_module/external/mapper/item_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/list_entity.dart';

class ListsMapper {
  static Map<String, dynamic> toJson(ListItems listItems) {
    return {
      'name': listItems.name,
      'description': listItems.description,
      'create_at': listItems.createAt,
    };
  }

  static ListItems fromDocument(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    {
      return ListItems(
        name: doc['name'] ?? '',
        description: doc['description'] ?? '',
        createAt: (doc['create_at'] as Timestamp).toDate(),
        id: doc.id,
      );
    }
  }
}
