import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/base_bloc/base_cubit.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart';

part 'home_state.dart';

@injectable
final class HomeCubit extends BaseCubit<HomeState> {
  final MessageUsecases _messageUsecases;
  HomeCubit(this._messageUsecases) : super(HomeInitial());

  @override
  void onBindingCreated() {
    super.onBindingCreated();
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
