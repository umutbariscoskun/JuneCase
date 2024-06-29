import 'package:equatable/equatable.dart';

final class MessageEntity extends Equatable {
  const MessageEntity({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.isLiked,
  });

  final String id;
  final String content;
  final DateTime createdAt;
  final bool isLiked;

  MessageEntity copyWith({
    String? id,
    String? content,
    DateTime? createdAt,
    bool? isLiked,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [id, content, createdAt, isLiked];
}
