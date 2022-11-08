import 'package:app_todo/app/modules/item_module/external/datasources/lists_datasources/get_lists_datasource_impl.dart';
import 'package:app_todo/app/modules/item_module/external/mapper/list_mapper.dart';
import 'package:app_todo/app/modules/item_module/infra/datasources/lists_datasources/get_lists_datasource.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late GetListsDatasource getListsDatasource;

  setUpAll(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    getListsDatasource = GetListsDatasourceImpl(fakeFirebaseFirestore);
  });

  group('GetListsDatasource test', () {});
  test('Should return a List of Firebase lists and items', () {
    when(
      () => fakeFirebaseFirestore
          .collection('Lists')
          .orderBy('create_at', descending: false)
          .snapshots()
          .map(
        (query) {
          return query.docs.map((doc) {
            return ListsMapper.fromDocument(doc);
          }).toList();
        },
      ),
    );
  });
}
