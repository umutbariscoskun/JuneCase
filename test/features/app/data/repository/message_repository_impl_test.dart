import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mutlumesaj/core/errors/failures.dart';
import 'package:mutlumesaj/features/app/data/repository/message_repository_impl.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';

import '../../../../helper/test_helper.dart';
import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockMessageRemoteDataSource messageRemoteDataSource;
  late MessageRepositoryImpl messageRepositoryImpl;

  provideDummy(getModelsFromJsonFile);

  setUp(() async {
    messageRemoteDataSource = MockMessageRemoteDataSource();
    messageRepositoryImpl = MessageRepositoryImpl(messageRemoteDataSource);
  });

  group('get messages', () {
    test('should return a list of entity and should match with the mockData',
        () async {
      when(
        messageRemoteDataSource.getMessages(page: 1),
      ).thenAnswer(
        (_) async => getModelsFromJsonFile(),
      );

      final result = await messageRepositoryImpl.getMessages(page: 1);
      final fold = result.fold((l) => l, (r) => r) as List<MessageEntity>;

      expect(
        fold.first.id,
        "1",
      );

      expect(
        fold.runtimeType,
        List<MessageEntity>,
      );
      final dummyList = mapModelsToEntities();
      expect(
        fold[4].id,
        dummyList[4].id,
      );
    });

    test('should return a failure', () async {
      when(
        messageRemoteDataSource.getMessages(page: 1),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badCertificate,
        ),
      );

      final result = await messageRepositoryImpl.getMessages(page: 1);

      expect(
        result,
        equals(
          Left<Failure?, MessageEntity>(
            ServerFailure(),
          ),
        ),
      );
    });

    test('should return connection failure when the device has no internet',
        () async {
      when(
        messageRemoteDataSource.getMessages(page: 1),
      ).thenThrow(
        const SocketException('Failed to connect to the network'),
      );

      final result = await messageRepositoryImpl.getMessages(page: 1);

      expect(
        result,
        equals(
          Left<Failure?, MessageEntity>(
            ServerFailure(message: 'Failed to connect to the network'),
          ),
        ),
      );
    });
  });
}
