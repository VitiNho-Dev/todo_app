import 'package:app_todo/app/modules/add_lists/domain/entities/list_entity.dart';
import 'package:app_todo/app/modules/add_lists/domain/errors/list_failures.dart';
import 'package:app_todo/app/modules/add_lists/external/datasource/list_datasource_impl.dart';
import 'package:app_todo/app/modules/add_lists/external/mapper/list_mapper.dart';
import 'package:app_todo/app/modules/add_lists/infra/datasource/list_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/lists.dart';

class FirebaseMock extends Mock implements FirebaseFirestore {
  
}
void main() async {
  late FirebaseFirestore _firebase;
  late ListDatasource _listDatasource;

  setUpAll(() async {
    _firebase = FirebaseMock();
    _listDatasource = ListDatasourceImpl(_firebase);
  });

  group('Teste do getLists', () {
    test('[Datasource] - Deve retornar os dados do Firebase', () async* {
      when(() => _firebase.collection(any()).snapshots().map((query) {
        return query.docs.map((doc) {
          return ListMapper.fromDocument(doc);
        }).toList();
      })).thenAnswer((_) => listsStream);

      final _result = _listDatasource.getLists();
      expect(_result.isEmpty, true);
      expect(_result, isA<Stream<List<ListEntity>>>());
    });

    test('[Datasource] - Deve retornar um erro', () async* {
      when(() => _firebase.collection(any()).snapshots().map((query) {
        return query.docs.map((doc) {
          return ListMapper.fromDocument(doc);
        }).toList();
      })).thenThrow((_) => DatasourceError('Error'));

      final _result = _listDatasource.getLists();
      expect(_result.isEmpty, false);
      expect(_result, isA<FirebaseException>());
    });
  });
}