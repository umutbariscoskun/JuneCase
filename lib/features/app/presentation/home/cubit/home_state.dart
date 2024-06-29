part of 'home_cubit.dart';

sealed class HomeState extends BaseState {
  const HomeState();
  @override
  List<Object> get props => [];
  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(HomeLoaded state) loaded,
  }) {
    return switch (this) {
      HomeInitial() => initial(),
      HomeLoading() => loading(),
      HomeLoaded() => loaded(this as HomeLoaded)
    };
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<MessageEntity> messages;

  const HomeLoaded(this.messages);

  HomeLoaded copyWith({
    List<MessageEntity>? messages,
  }) {
    return HomeLoaded(
      messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => [messages];
}
