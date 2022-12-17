import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/list_entity.dart';
import '../../../infra/datasources/lists_datasources/add_list_datasource.dart';
import '../../mapper/list_mapper.dart';

class AddListDatasourceImpl implements AddListDatasource {
  final FirebaseFirestore _firebaseFirestore;

  AddListDatasourceImpl(this._firebaseFirestore);

  @override
  Future<Unit> addLists(ListItems listItems) async {
    await _firebaseFirestore.collection('Lists').add(
          ListsMapper.toJson(listItems),
        );
    return unit;
  }
}
