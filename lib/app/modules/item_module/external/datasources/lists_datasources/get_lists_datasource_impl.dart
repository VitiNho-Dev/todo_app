import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../infra/datasources/lists_datasources/get_lists_datasource.dart';

class GetListsDatasourceImpl implements GetListsDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetListsDatasourceImpl(this._firebaseFirestore);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getLists() {
    try {
      final snapshot = _firebaseFirestore
          .collection('Lists')
          .orderBy('create_at', descending: false)
          .snapshots();
      return snapshot;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
