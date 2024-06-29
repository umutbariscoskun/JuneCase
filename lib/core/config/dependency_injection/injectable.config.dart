// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mutlumesaj/core/config/dependency_injection/module.dart'
    as _i10;
import 'package:mutlumesaj/core/config/router/router.dart' as _i5;
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart'
    as _i3;
import 'package:mutlumesaj/features/app/data/repository/message_repository_impl.dart'
    as _i7;
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart'
    as _i6;
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart'
    as _i8;
import 'package:mutlumesaj/features/app/presentation/home/cubit/home_cubit.dart'
    as _i9;
import 'package:mutlumesaj/features/app/presentation/splash/cubit/splash_cubit.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.MessageRemoteDataSource>(
        () => registerModule.messageDioClient);
    gh.factory<_i4.SplashCubit>(() => _i4.SplashCubit());
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.factory<_i6.MessageRepository>(
        () => _i7.MessageRepositoryImpl(gh<_i3.MessageRemoteDataSource>()));
    gh.factory<_i8.GetMessagesUseCase>(
        () => _i8.GetMessagesUseCase(gh<_i6.MessageRepository>()));
    gh.factory<_i8.UpdateMessageUseCase>(
        () => _i8.UpdateMessageUseCase(gh<_i6.MessageRepository>()));
    gh.factory<_i8.MessageUsecases>(() => _i8.MessageUsecases(
          getMessagesUseCase: gh<_i8.GetMessagesUseCase>(),
          updateMessageUseCase: gh<_i8.UpdateMessageUseCase>(),
        ));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i8.MessageUsecases>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
