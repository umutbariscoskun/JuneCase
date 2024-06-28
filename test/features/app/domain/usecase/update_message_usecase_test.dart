import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart';

import 'usecase_mock_gen_test.mocks.dart';

void main() {
  UpdateMessageUseCase? useCase;
  MessageRepository? mockRepo;
  late String mockId;
  MessageEntity? entity;

  setUp(() {
    mockId = '1';

    mockRepo = FakeRepo();
    useCase = UpdateMessageUseCase(mockRepo!);

    entity = MessageEntity(
        id: "1", content: "content", isLiked: false, createdAt: DateTime.now());
  });

  test(
    'should update the entity',
    () async {
      // remove function has void return type
      // It Returns Right not failure
      when(mockRepo!.updateMessage(messageEntity: entity!))
          .thenAnswer((_) async => Right(entity!));

      final testResult =
          await useCase!(UpdateMessageParams(messageEntity: entity!));
      testResult.fold((l) => null, (r) {
        //test id
        expect(r.id, mockId);
      });
      // test response
      expect(testResult, Right(entity!));
    },
  );
}
