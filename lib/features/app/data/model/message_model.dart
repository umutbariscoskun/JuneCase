// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  MessageModel({
    required this.id,
    required this.content,
    required this.isLiked,
    required this.createdAt,
  });

  final String id;
  final String content;
  final bool isLiked;
  final DateTime createdAt;

  MessageModel copyWith({
    String? id,
    String? content,
    bool? isLiked,
    DateTime? createdAt,
  }) {
    return MessageModel(
      id: id ?? this.id,
      content: content ?? this.content,
      isLiked: isLiked ?? this.isLiked,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'isLiked': isLiked,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      content: map['content'] as String,
      isLiked: map['isLiked'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromMap(String source) =>
      MessageModel.fromJson(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(id: $id, content: $content, isLiked: $isLiked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.isLiked == isLiked &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        isLiked.hashCode ^
        createdAt.hashCode;
  }
}
