enum MessageType { sent, received }

class Message {
  final String id;
  final String text;
  final DateTime time;
  final MessageType type;

  Message({
    required this.id,
    required this.text,
    required this.time,
    required this.type,
  });
}
