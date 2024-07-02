import 'package:flutter_test/flutter_test.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';

void main() {
  final MessageEntity testEntity = MessageEntity(
      id: "1", content: "content", isLiked: false, createdAt: DateTime.now());

  test('should be a subclass of a entity', () async {
    expect(testEntity, isA<MessageEntity>());
  });
}
