import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/item_entity.dart';
import '../../../domain/entities/list_entity.dart';
import '../../../infra/datasources/lists_datasources/get_lists_datasource.dart';
import '../../mapper/list_mapper.dart';

class GetListsDatasourceImpl implements GetListsDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetListsDatasourceImpl(this._firebaseFirestore);

  @override
  Stream<List<ListItems>> getLists() {
    return _firebaseFirestore
        .collection('Lists')
        .orderBy('create_at', descending: false)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return ListsMapper.fromDocument(doc);
      }).toList();
    });
  }
}
