import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/errors/failures.dart';
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart';
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
      {required int page}) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MessageEntity>> updateMessage(
      {required MessageEntity messageEntity}) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }
}
