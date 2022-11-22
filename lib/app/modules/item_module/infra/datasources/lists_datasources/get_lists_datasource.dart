import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetListsDatasource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getLists();
}
