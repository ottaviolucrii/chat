import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Olá, tudo bem?',
      userId: '1',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      userName: 'Test User',
      userImageURL: 'assets\images\avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Tudo ótimo, e você?',
      userId: '2',
      createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      userName: 'Test User 2',
      userImageURL: 'assets\images\avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    _controller!.add(_msgs);
  });

  ChatMockService();

  Future<ChatMessage> save(String text, ChatUser user) async {
    final _newMessagem = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      userId: user.id,
      createdAt: DateTime.now(),
      userName: user.name,
      userImageURL: user.imageUrl,
    );
    _msgs.add(_newMessagem);
    _controller!.add(_msgs);
    return _newMessagem;
  }

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return  _msgStream;
  }
  
  @override
  // TODO: implement userChanges
  Stream<ChatUser?> get userChanges => throw UnimplementedError();

  @override
  // TODO: implement currentUser
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String name, String email, String password, File? image) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}