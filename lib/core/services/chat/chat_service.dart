import 'dart:io';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_mock_service.dart';

abstract class ChatService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage>save(String text, ChatUser user);

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();

  factory ChatService(){
    return ChatMockService();
    // return ChatFirebaseService();
  }
}