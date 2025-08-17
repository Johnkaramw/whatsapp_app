import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../screens/chat_screen.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  const ChatTile({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final last = chat.lastMessage;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 220),
            pageBuilder: (_, anim, __) => FadeTransition(
              opacity: anim,
              child: ChatScreen(chat: chat),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            Hero(
              tag: 'avatar_${chat.id}',
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                // avatarEmoji في موديلك عبارة عن Emoji نصي، فنستخدم Text
                child: Text(
                  chat.avatarEmoji,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        last != null ? _formatTime(last.time) : '',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).textTheme.bodySmall?.color?.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    last?.text ?? 'No messages yet',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    if (dt.day == now.day && dt.month == now.month && dt.year == now.year) {
      final hh = dt.hour.toString().padLeft(2, '0');
      final mm = dt.minute.toString().padLeft(2, '0');
      return '$hh:$mm';
    }
    return '${dt.day}/${dt.month}/${dt.year % 100}';
  }
}
