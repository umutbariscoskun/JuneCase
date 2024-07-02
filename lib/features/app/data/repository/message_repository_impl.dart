import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/errors/failures.dart';
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart';
import 'package:mutlumesaj/features/app/data/model/message_model.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';

@Injectable(as: MessageRepository)
@lazySingleton
class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource _messageRemoteDataSource;

  MessageRepositoryImpl(MessageRemoteDataSource messageRemoteDatasource)
      : _messageRemoteDataSource = messageRemoteDatasource;

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(
      {required int page}) async {
    try {
      final entityList = <MessageEntity>[];
      final result = await _messageRemoteDataSource.getMessages(page: page);

      for (final model in result) {
        entityList.add(
          MessageEntity(
            id: model.id,
            content: model.content,
            createdAt: model.createdAt,
            isLiked: model.isLiked,
          ),
        );
      }

      return Right(entityList);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> updateMessage(
      {required MessageEntity messageEntity}) async {
    try {
      final id = messageEntity.id;
      final model = MessageModel(
        id: id,
        content: messageEntity.content,
        isLiked: messageEntity.isLiked,
        createdAt: messageEntity.createdAt,
      );

      final result = await _messageRemoteDataSource.updateMessage(
          id: id, body: model.toMap());
      // Getting and using real id from api
      final entityFromModelId = messageEntity.copyWith(id: result.id);
      return Right(entityFromModelId);
    } on Exception catch (error) {
      log(error.toString());
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
