import 'package:app_todo/app/modules/item_module/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/item_module/external/datasources/lists_datasources/get_lists_datasource_impl.dart';
import 'package:app_todo/app/modules/item_module/external/mapper/list_mapper.dart';
import 'package:app_todo/app/modules/item_module/infra/datasources/lists_datasources/get_lists_datasource.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late GetListsDatasource getListsDatasource;
  final listItems = [
    ListItems(
      id: '1234',
      name: 'Teste',
      description: 'Testando',
      createAt: DateTime(2022),
    ),
  ];

  setUpAll(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    getListsDatasource = GetListsDatasourceImpl(fakeFirebaseFirestore);
  });

  test('Should return a List of Firebase lists and items', () async* {
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
    ).thenAnswer((invocation) async* {
      yield listItems;
    });

    final result = getListsDatasource.getLists();

    expect(result, isA<List<ListItems>>());
  });
}
