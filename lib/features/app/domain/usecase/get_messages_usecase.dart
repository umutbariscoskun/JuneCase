part of 'message_usecases.dart';

@immutable
@injectable

///Get Messages
class GetMessagesUseCase
    extends UseCase<List<MessageEntity>, GetMessagesParams> {
  final MessageRepository _messageRepository;
  GetMessagesUseCase(this._messageRepository);

  @override
  Future<Either<Failure, List<MessageEntity>>> call(GetMessagesParams params) {
    return _messageRepository.getMessages(page: params.page);
  }
}

class GetMessagesParams {
  final int page;
  GetMessagesParams({required this.page});
}
