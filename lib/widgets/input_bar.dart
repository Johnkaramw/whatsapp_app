import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  final Function(String) onSend;

  const InputBar({super.key, required this.onSend});

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (_controller.text.trim().isEmpty) return;
    widget.onSend(_controller.text.trim());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.green),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }
}
