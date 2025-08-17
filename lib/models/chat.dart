import 'message.dart';

class Chat {
  final String id;
  final String name;
  final String? avatarEmoji; // optional الآن
  final String? avatarImage; // ✅ جديد: رابط الصورة من assets
  final List<Message> messages;

  Chat({
    required this.id,
    required this.name,
    this.avatarEmoji, // اختياري دلوقتي
    this.avatarImage, // اختياري
    required this.messages,
  });

  // آخر رسالة
  Message? get lastMessage => messages.isNotEmpty ? messages.last : null;
}
