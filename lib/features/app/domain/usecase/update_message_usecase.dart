part of 'message_usecases.dart';

@immutable
@injectable

///Updates a message
class UpdateMessageUseCase extends UseCase<MessageEntity, UpdateMessageParams> {
  final MessageRepository _messageRepository;

  UpdateMessageUseCase(this._messageRepository);
  @override
  Future<Either<Failure, MessageEntity>> call(
      UpdateMessageParams params) async {
    return await _messageRepository.updateMessage(
        messageEntity: params.messageEntity);
  }
}

class UpdateMessageParams {
  final MessageEntity messageEntity;
  UpdateMessageParams({required this.messageEntity});
}
