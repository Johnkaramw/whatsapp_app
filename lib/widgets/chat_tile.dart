import 'package:flutter/material.dart';
import 'package:whatsapp_app/models/message.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Hero(
              tag: 'avatar_${chat.id}',
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                backgroundImage: chat.avatarImage != null
                    ? AssetImage(chat.avatarImage!)
                    : null,
                child: chat.avatarImage == null
                    ? Text(
                        chat.avatarEmoji ?? '',
                        style: const TextStyle(fontSize: 22),
                      )
                    : null,
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
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Text(
                        last != null ? _formatTime(last.time) : '',
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.color
                              ?.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          last?.text ?? 'No messages yet',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.color
                                ?.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (last != null && last.type == MessageType.received)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                    ],
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
