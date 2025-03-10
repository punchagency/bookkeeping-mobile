class MessageModel {
  final int? messageId;
  final String? sender;
  final DateTime? timestamp;
  final String? content;

  MessageModel({
    this.messageId,
    this.sender,
    this.timestamp,
    this.content,
  });

  // Factory constructor to create an instance from a Map (JSON)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['message_id'] as int?,
      sender: json['sender'] as String?,
      timestamp: json['timestamp'] != null ? DateTime.tryParse(json['timestamp']) : null,
      content: json['content'] as String?,
    );
  }

  // Convert MessageModel to Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'sender': sender,
      'timestamp': timestamp?.toIso8601String(),
      'content': content,
    };
  }
   factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map["message_id"],
      sender: map["sender"],
      timestamp: DateTime.parse(map["timestamp"]),
      content: map["content"],
    );
  }
}
