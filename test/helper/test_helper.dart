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

List<MessageModel> getModelsFromJsonFile() {
  final jsonMap = jsonDecode(jsonMessagesData);
  List<MessageModel> messages = List<MessageModel>.from(
      jsonMap.map((model) => MessageModel.fromJson(model)));
  return messages;
}

List<MessageEntity> mapModelsToEntities() {
  var models = getModelsFromJsonFile();
  return models.map((model) {
    return MessageEntity(
      id: model.id,
      content: model.content,
      createdAt: DateTime.now(), // Assuming createdAt is in seconds
      isLiked: model.isLiked,
    );
  }).toList();
}
