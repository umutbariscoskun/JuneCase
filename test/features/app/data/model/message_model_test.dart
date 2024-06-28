import 'package:flutter_test/flutter_test.dart';
import 'package:mutlumesaj/features/app/data/model/message_model.dart';

void main() {
  final MessageModel testModel = MessageModel(
      id: "1", content: "content", isLiked: false, createdAt: DateTime.now());

  test('should be a subclass of a model', () async {
    expect(testModel, isA<MessageModel>());
  });
}
