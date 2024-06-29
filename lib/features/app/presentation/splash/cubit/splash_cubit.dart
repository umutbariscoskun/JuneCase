import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/base_bloc/base_cubit.dart';
import 'package:mutlumesaj/core/config/router/router.dart';
import 'package:mutlumesaj/core/shared/helper_functions.dart';
import 'package:mutlumesaj/features/app/presentation/splash/cubit/splash_state.dart';

@injectable
final class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  @override
  void onBindingCreated() async {
    super.onBindingCreated();

    await Future.delayed(const Duration(seconds: 3)).then(
      (value) => appRouter.pushAndPopUntil(
        const HomeRoute(),
        predicate: (route) {
          return route.settings.name == HomeRoute.name;
        },
      ),
    );
  }
}
