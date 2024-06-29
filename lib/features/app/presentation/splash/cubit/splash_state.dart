import 'package:mutlumesaj/core/base_bloc/base_cubit.dart';

sealed class SplashState extends BaseState {
  const SplashState();
  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {
  const SplashInitial();
}

final class SplashLoading extends SplashState {
  const SplashLoading();
}

final class SplashLoaded extends SplashState {}

final class SplashError extends SplashState {
  final String message;
  const SplashError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
