// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mutlumesaj/core/config/dependency_injection/module.dart' as _i8;
import 'package:mutlumesaj/core/config/router/router.dart' as _i4;
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart'
    as _i3;
import 'package:mutlumesaj/features/app/data/repository/message_repository_impl.dart'
    as _i6;
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart'
    as _i5;
import 'package:mutlumesaj/features/app/domain/usecase/message_usecases.dart'
    as _i7;

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
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.MessageRepository>(
        () => _i6.MessageRepositoryImpl(gh<_i3.MessageRemoteDataSource>()));
    gh.factory<_i7.GetMessagesUseCase>(
        () => _i7.GetMessagesUseCase(gh<_i5.MessageRepository>()));
    gh.factory<_i7.UpdateMessageUseCase>(
        () => _i7.UpdateMessageUseCase(gh<_i5.MessageRepository>()));
    gh.factory<_i7.MessageUsecases>(() => _i7.MessageUsecases(
          getMessagesUseCase: gh<_i7.GetMessagesUseCase>(),
          updateMessageUseCase: gh<_i7.UpdateMessageUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
