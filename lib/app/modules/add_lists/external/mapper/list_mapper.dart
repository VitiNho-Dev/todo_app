import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListMapper {
  static Map<String, dynamic> toJson(ListEntity listEntity) {
    return {
      'create_at': listEntity.createAt,
      'description': listEntity.description,
      'name': listEntity.name,
    };
  }

  static ListEntity fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return ListEntity(
      id: doc.id,
      createAt: doc['create_at'],
      description: doc['description'],
      name: doc['name'],
    );
  }
}
