import 'package:mutlumesaj/core/config/dependency_injection/injectable.dart';
import 'package:mutlumesaj/core/config/router/router.dart';
import 'package:mutlumesaj/core/constants/locale_key_constants.dart';

final AppRouter appRouter = getIt<AppRouter>();

final LocaleKeyConstants _localeKeyConstants = LocaleKeyConstants();

LocaleKeyConstants get locales => _localeKeyConstants;
