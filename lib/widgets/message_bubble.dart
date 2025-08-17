// lib/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isSent = message.type == MessageType.sent;
    final bg = isSent
        ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.95)
        : Theme.of(context).colorScheme.surface;
    final textColor = isSent
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurface;
    final alignment = isSent
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Row(
            mainAxisAlignment: isSent
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: isSent
                          ? const Radius.circular(12)
                          : Radius.zero,
                      bottomRight: isSent
                          ? Radius.zero
                          : const Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.text,
                          style: TextStyle(fontSize: 15, color: textColor),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _formatTime(message.time),
                              style: TextStyle(
                                fontSize: 11,
                                color: textColor.withOpacity(0.75),
                              ),
                            ),
                            if (isSent) ...[
                              const SizedBox(width: 6),
                              Icon(
                                Icons.done_all,
                                size: 16,
                                color: textColor.withOpacity(0.75),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
  }
}
