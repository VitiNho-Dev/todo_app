import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/add_lists/external/mapper/list_mapper.dart';
import 'package:app_todo/app/modules/add_lists/infra/datasource/list_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ListDatasourceImpl implements ListDatasource {
  final FirebaseFirestore _firebaseFirestore;

  ListDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> addList(ListEntity listEntity) async {
    await _firebaseFirestore.collection('Lists').add(
          ListMapper.toJson(listEntity),
        );
    return unit;
  }

  @override
  Future<Unit> deleteList(ListEntity listEntity) async {
    await _firebaseFirestore.collection('Lists').doc(listEntity.id).delete();
    return unit;
  }

  @override
  Stream<List<ListEntity>> getLists() {
    return _firebaseFirestore
        .collection('Lists')
        .orderBy('create_at', descending: false)
        .snapshots()
        .map((query) {
      return query.docs.map((doc) {
        return ListMapper.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<Unit> updateList(ListEntity listEntity) async {
    await _firebaseFirestore.collection('List').doc(listEntity.id).update(
          ListMapper.toJson(listEntity),
        );
    return unit;
  }
}
