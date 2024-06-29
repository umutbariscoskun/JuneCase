import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/base_bloc/base_cubit.dart';
import 'package:mutlumesaj/core/constants/data_constants.dart';
import 'package:mutlumesaj/core/utils/extensions/cubit_extension.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart';

part 'home_state.dart';

@injectable
final class HomeCubit extends BaseCubit<HomeState> {
  final MessageUsecases _messageUsecases;
  HomeCubit(this._messageUsecases) : super(HomeInitial());
  int _page = 1;
  bool isLastPage = false;
  final _list = <MessageEntity>[];

  @override
  void onBindingCreated() async {
    emit(HomeLoading());

    await getMessages();

    super.onBindingCreated();
  }

  Future<void> onIndexChanged(int index) async {
    if (index % 4 == 0) {
      if (!isLastPage) {
        _page++;

        await getMessages();
      }
    }
  }

  Future<void> getMessages() async {
    if (!isLastPage) {
      final result = await foldAsync(() async => await _messageUsecases
          .getMessagesUseCase
          .call(GetMessagesParams(page: _page)));

      if (result != null) {
        if (result.isEmpty) {
          isLastPage = true;
        } else {
          if (result.length < DataConstants.paginationLimit) {
            isLastPage = true;
          }

          _list.addAll(result);

          ///to prevent duplicate elements
          ///there might be duplicates because of new added accounts
          final Set<MessageEntity> list = <MessageEntity>{};
          list.addAll(_list);

          emit(HomeLoaded([...list]));
        }
      }
    }
  }

  Future<void> likeAnItem(MessageEntity item) async {
    var e = item;

    final likedData = (state as HomeLoaded).messages.map((entity) {
      if (entity.id == item.id) {
        e = entity.copyWith(isLiked: !entity.isLiked);

        return e;
      }

      return entity;
    }).toList();

    updateApiMessage(e);
    emit((state as HomeLoaded).copyWith(messages: likedData));
  }

  Future<void> updateApiMessage(MessageEntity entity) async {
    await foldAsync(() async => await _messageUsecases.updateMessageUseCase
        .call(UpdateMessageParams(messageEntity: entity)));
  }
}
