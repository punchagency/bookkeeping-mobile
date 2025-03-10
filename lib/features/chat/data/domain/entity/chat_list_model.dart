import 'package:elmer/features/chat/data/domain/entity/message_model.dart';

class ChatModel {
  final int? chatId;
  final String? chatTitle;
  final List<String>? participants;
  final DateTime? timestamp;
  final List<MessageModel>? messages;

  ChatModel({
    this.chatId,
    this.chatTitle,
    this.participants,
    this.timestamp,
    this.messages,
  });

  // Factory constructor to create an instance from a Map (JSON)
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chat_id'] as int?,
      chatTitle: json['chat_title'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'])
          : null,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((message) => MessageModel.fromJson(message))
          .toList(),
    );
  }

  // Convert ChatModel to Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'chat_id': chatId,
      'chat_title': chatTitle,
      'participants': participants,
      'timestamp': timestamp?.toIso8601String(),
      'messages': messages?.map((message) => message.toJson()).toList(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map["chat_id"],
      chatTitle: map["chat_title"],
      participants: List<String>.from(map["participants"]),
      timestamp: DateTime.parse(map["timestamp"]),
      messages: (map["messages"] as List)
          .map((msg) => MessageModel.fromMap(msg))
          .toList(),
    );
  }
}
