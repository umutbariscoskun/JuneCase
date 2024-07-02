import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/core/config/dependency_injection/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}
