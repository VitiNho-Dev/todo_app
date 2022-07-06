import 'package:app_todo/app/modules/add_items/domain/entities/item_entity.dart';
import 'package:app_todo/app/modules/add_items/external/data_sources/todo_data_source_impl.dart';
import 'package:app_todo/app/modules/add_items/external/mapper/todo_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/list_items.dart';

class FirebaseMock extends Mock implements FirebaseFirestore {}

void main() {
  final firebase = FirebaseMock();
  final dataSource = TodoDataSourceImpl(firebase);

  test('Deve trazer os items do firebase', () async* {
    when(() => firebase.collection(any()).snapshots().map((query) {
          return query.docs.map((doc) {
            return TodoMapper.fromDocument(doc);
          }).toList();
        })).thenAnswer((_) => listStream);

    final result = dataSource.getItems();
    expect(result, isA<Stream<List<Item>>>());
  });
}
