import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart';
import 'package:mutlumesaj/features/app/data/model/message_model.dart';

import '../../../../helper/test_helper.dart';

void main() {
  late MessageRemoteDataSource messageRemoteDataSource;
  late MockWebServer mockWebServer;
  final headers = {'Content-Type': 'application/json'};

  setUp(() async {
    mockWebServer = MockWebServer();
    await mockWebServer.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    messageRemoteDataSource =
        MessageRemoteDataSource(dio, baseUrl: mockWebServer.url);
  });

  tearDown(() {
    mockWebServer.shutdown();
  });

  group('MessagesDataSource', () {
    test('should return MessageModel when the response code is 200', () async {
      mockWebServer.enqueue(
        body: jsonMessagesData,
        headers: headers,
      );

      final result = await messageRemoteDataSource.getMessages(page: 1);

      expect(result, isA<List<MessageModel>>());
    });

    test('should throw an exception when the response code is not 200',
        () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
      );

      expect(
        () => messageRemoteDataSource.getMessages(page: 1),
        throwsA(isA<Exception>()),
      );
    });
  });
}
