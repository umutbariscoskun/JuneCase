import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/base_bloc/base_cubit.dart';
import 'package:mutlumesaj/core/config/router/router.dart';
import 'package:mutlumesaj/core/shared/helper_functions.dart';
import 'package:mutlumesaj/core/utils/extensions/cubit_extension.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart';
import 'package:mutlumesaj/features/app/presentation/splash/cubit/splash_state.dart';

@injectable
final class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(
    this._messageUsecases,
  ) : super(const SplashInitial());
  final MessageUsecases _messageUsecases;
  @override
  void onBindingCreated() async {
    super.onBindingCreated();
    final result = await getMessages();
    await Future.delayed(const Duration(milliseconds: 300)).then(
      (value) => appRouter.pushAndPopUntil(
        HomeRoute(messages: result),
        predicate: (route) {
          return route.settings.name == HomeRoute.name;
        },
      ),
    );
  }

  Future<List<MessageEntity>> getMessages() async {
    final result = await foldAsync(() async => await _messageUsecases
        .getMessagesUseCase
        .call(GetMessagesParams(page: 1)));

    return result ?? [];
  }
}
