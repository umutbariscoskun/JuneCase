import 'package:injectable/injectable.dart';
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart';
import 'package:mutlumesaj/features/app/data/service/dio_client.dart';

@module
abstract class RegisterModule {
  final MessageRemoteDataSource accountDioClient =
      MessageRemoteDataSource(AccountDioClient.dio);
}
