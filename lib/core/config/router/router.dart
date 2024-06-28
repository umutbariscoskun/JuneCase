import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/features/app/presentation/home/home_view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
@lazySingleton
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
