import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../infra/datasources/item_datasources/get_item_datasource.dart';

class GetItemDatasourceImpl implements GetItemDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetItemDatasourceImpl(this._firebaseFirestore);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getItems() {
    try {
      final snapshot = _firebaseFirestore
          .collection('Lists')
          .doc('Xgzz71T9nAYkAVgmPQXc')
          .collection('Items')
          .orderBy('create_at', descending: false)
          .snapshots();
      return snapshot;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
