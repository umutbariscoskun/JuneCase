import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart';

import 'usecase_mock_gen_test.mocks.dart';

void main() {
  GetMessagesUseCase? usecase;
  MessageRepository? mockRepo;
  List<MessageEntity> list = [];
  MessageEntity? entity;
  setUp(() {
    mockRepo = FakeRepo();
    usecase = GetMessagesUseCase(mockRepo!);

    entity = MessageEntity(
        id: "1", content: "content", isLiked: false, createdAt: DateTime.now());
  });

  test(
    'should GET from the  repository',
    () async {
      list.add(entity!);

      when(mockRepo!.getMessages(page: 1)).thenAnswer((_) async => Right(list));

      final testResult = await usecase!(GetMessagesParams(page: 1));
      testResult.fold((l) => null, (r) {
        //check id
        expect(entity!.id, r.first.id);
      });
      //check response
      expect(testResult, Right(list));
    },
  );
}
