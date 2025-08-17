import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isViewed;

  const StoryItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isViewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: isViewed ? Colors.grey : Colors.green,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
