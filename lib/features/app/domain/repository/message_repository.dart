import 'package:mutlumesaj/core/errors/failures.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<MessageEntity>>> getMessages({required int page});
  Future<Either<Failure, MessageEntity>> updateMessage(
      {required MessageEntity messageEntity});
}
