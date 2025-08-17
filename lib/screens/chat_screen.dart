import 'package:flutter/material.dart';

import '../models/chat.dart';
import '../models/message.dart';
import '../widgets/input_bar.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Message> _messages;

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.chat.messages);
  }

  void _handleSend(String text) {
    if (text.trim().isEmpty) return;
    final msg = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text.trim(),
      time: DateTime.now(),
      type: MessageType.sent,
    );
    setState(() {
      _messages.add(msg);
      _listKey.currentState?.insertItem(
        _messages.length - 1,
        duration: const Duration(milliseconds: 250),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 32,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            Hero(
              tag: 'avatar_${widget.chat.id}',
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                backgroundImage: widget.chat.avatarImage != null
                    ? AssetImage(widget.chat.avatarImage!)
                    : null, // عرض الصورة كـ بروفايل
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _messages.length,
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemBuilder: (context, index, animation) {
                final msg = _messages[_messages.length - 1 - index];
                return SizeTransition(
                  sizeFactor: animation,
                  child: MessageBubble(message: msg),
                );
              },
            ),
          ),
          InputBar(onSend: _handleSend),
        ],
      ),
    );
  }
}
