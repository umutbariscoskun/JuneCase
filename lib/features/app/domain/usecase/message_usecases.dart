import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/errors/failures.dart';
import 'package:mutlumesaj/core/usecase/usecase.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';

part 'get_messages_usecase.dart';
part 'update_message_usecase.dart';

@immutable
@injectable

///Base use case for reaching Message Use cases
///includes all of MessageUseCases
///You can call only this: `MessageUseCases`
///than use `messageUseCases.getMessagesUseCase` for example
class MessageUsecases {
  const MessageUsecases({
    required this.getMessagesUseCase,
    required this.updateMessageUseCase,
  });

  final GetMessagesUseCase getMessagesUseCase;

  final UpdateMessageUseCase updateMessageUseCase;
}
