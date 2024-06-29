import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mutlumesaj/core/base_bloc/base_view.dart';
import 'package:mutlumesaj/core/config/dependency_injection/injectable.dart';
import 'package:mutlumesaj/features/app/presentation/splash/cubit/splash_cubit.dart';
import 'package:mutlumesaj/features/app/presentation/splash/cubit/splash_state.dart';

@RoutePage()
final class SplashScreen extends BaseView<SplashCubit, SplashState> {
  SplashScreen({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, SplashCubit cubit) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
