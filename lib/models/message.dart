class Message {
  String msg;
  late final MessageType messageType;

  Message({required this.messageType, required this.msg});
}

enum MessageType { user, bot }
