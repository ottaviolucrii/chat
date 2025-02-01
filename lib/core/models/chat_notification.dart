class ChatNotification {
  final String title;
  final String body;
  

  const ChatNotification({
    required this.title,
    required this.body,
    
  });

  factory ChatNotification.fromMap(Map<String, dynamic> map) {
    return ChatNotification(
      title: map['title'],
      body: map['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      
    };
  }
}