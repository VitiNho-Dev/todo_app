import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/item_entity.dart';

class TodoMapper {
  static Map<String, dynamic> toJson(Item item) {
    return {
      'title': item.title,
      'check': item.check,
      'create_at': item.createAt,
    };
  }

  static Item fromDocument(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return Item(
      title: doc['title'] ?? '',
      check: doc['check'] ?? '',
      id: doc.id,
      createAt: (doc['create_at'] as Timestamp).toDate(),
    );
  }
}
