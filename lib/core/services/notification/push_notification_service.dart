import 'package:chat/core/models/chat_notification.dart';
import 'package:flutter/material.dart';

class PushNotificationService with ChangeNotifier {
  List <ChatNotification> _items = [];

  List <ChatNotification> get items {
    return [..._items];
  }

  void addNotification(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }

  void remove(int i) {
    _items.removeAt(i);
  }


}