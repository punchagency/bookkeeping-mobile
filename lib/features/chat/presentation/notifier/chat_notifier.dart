import 'package:elmer/features/chat/data/domain/entity/chat_list_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatNotifier extends ChangeNotifier {
  final List<ChatModel> chats = [
    ChatModel.fromMap({
      "chat_id": 1,
      "chat_title": "AI Assistant Chat",
      "participants": ["User", "AI"],
      "timestamp": "2025-02-10T10:00:00Z",
      "messages": [
        {
          "message_id": 101,
          "sender": "User",
          "timestamp": "2025-03-10T10:00:00Z",
          "content": "Hey AI, how can I reduce my business expenses?"
        },
        {
          "message_id": 102,
          "sender": "AI",
          "timestamp": "2025-03-10T10:00:05Z",
          "content":
              "Reducing business expenses can be done through various strategies:\n- Cut unnecessary subscriptions or services.\n- Negotiate better rates with suppliers.\n- Optimize office space and consider remote work.\n- Automate processes using AI and software."
        }
      ]
    }),
    ChatModel.fromMap({
      "chat_id": 2,
      "chat_title": "AI Tech Chat",
      "participants": ["User", "AI"],
      "timestamp": "2025-03-10T11:30:00Z",
      "messages": [
        {
          "message_id": 201,
          "sender": "User",
          "timestamp": "2025-03-10T11:30:00Z",
          "content": "Hey AI, can you explain how machine learning works?"
        },
        {
          "message_id": 202,
          "sender": "AI",
          "timestamp": "2025-03-10T11:30:10Z",
          "content":
              "Machine learning is a type of AI that enables systems to learn from data..."
        }
      ]
    })
  ];

  Map<String, List<ChatModel>> get categorizedChats {
    Map<String, List<ChatModel>> categorized = {};

    for (var chat in chats) {
      if (chat.timestamp == null) continue;

      DateTime chatDate = chat.timestamp!;
      String category = _getCategory(chatDate);

      if (!categorized.containsKey(category)) {
        categorized[category] = [];
      }
      categorized[category]!.add(chat);
    }

    for (var category in categorized.keys) {
      categorized[category]!
          .sort((a, b) => b.timestamp!.compareTo(a.timestamp!));
    }

    final sortedCategories = categorized.entries.toList()
      ..sort((a, b) =>
          b.value.first.timestamp!.compareTo(a.value.first.timestamp!));

    return Map.fromEntries(sortedCategories);
  }

  String _getCategory(DateTime date) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime twoDaysAgo = today.subtract(Duration(days: 2));

    if (date.isAfter(today)) {
      return 'Today';
    } else if (date.isAfter(yesterday)) {
      return 'Yesterday';
    } else if (date.isAfter(twoDaysAgo)) {
      return 'Two days ago';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void selectDiscussion(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = null;
    } else {
      _selectedIndex = index;
    }
    notifyListeners();
  }
}
