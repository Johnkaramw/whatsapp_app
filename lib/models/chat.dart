import 'message.dart';

class Chat {
  final String id;
  final String name;
  final String
  avatarEmoji; // using emoji instead of asset to keep project self-contained
  final List<Message> messages;

  Chat({
    required this.id,
    required this.name,
    required this.avatarEmoji,
    required this.messages,
  });

  Message? get lastMessage => messages.isNotEmpty ? messages.last : null;
}
