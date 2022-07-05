import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/item_entity.dart';

class TodoMapper {
  static Map<String, dynamic> toJson(ItemEntity item) {
    return {
      'title': item.title,
      'check': item.check,
      'create_at': item.createAt,
    };
  }

  static ItemEntity fromDocument(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return ItemEntity(
      title: doc['title'] ?? '',
      check: doc['check'] ?? '',
      id: doc.id,
      createAt: (doc['create_at'] as Timestamp).toDate(),
    );
  }
}
