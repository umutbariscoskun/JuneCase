import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mutlumesaj/core/constants/data_constants.dart';

mixin MessageDioClient {
  static final Dio dio = _init();
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: DataConstants.baseUrl,
    headers: {HttpHeaders.acceptHeader: 'application/json'},
  );
  static Dio _init() {
    final dio = Dio(_baseOptions);
    return dio;
  }
}
