import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetItemDatasource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getItems();
}
