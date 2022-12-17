import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../infra/datasources/lists_datasources/delete_list_datasource.dart';

class DeleteListDatasourceImpl implements DeleteListDatasource {
  final FirebaseFirestore _firebaseFirestore;

  DeleteListDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> deleteList(ListItems listItems) async {
    await _firebaseFirestore.collection('Lists').doc(listItems.id).delete();
    return unit;
  }
}
