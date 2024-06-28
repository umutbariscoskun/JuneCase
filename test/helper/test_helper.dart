import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mutlumesaj/features/app/data/datasource/remote/message_remote_datasource.dart';
import 'package:mutlumesaj/features/app/data/model/message_model.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/domain/repository/message_repository.dart';

import 'json_reader.dart';

@GenerateMocks([MessageRemoteDataSource, MessageRepository])
void main() {}

const dummyDataPath = 'helper/dummy_data/dummy_data_messages.json';

/// Get the dummy messageModel
var messageModel = MessageModel(
    id: "1", content: "content", isLiked: false, createdAt: DateTime.now());

/// Get the dummy data from the json file
String get jsonMessagesData => readJson(dummyDataPath);

/// Get the dummy MessageResponseModel
MessageModel get dummyMessageResponseModel => MessageModel.fromJson(
      jsonDecode(readJson(dummyDataPath)),
    );

/// Get the dummy MessageEntity
MessageEntity get dummyMessageResponseEntity =>
    dummyMessageResponseModel.toEntity();
