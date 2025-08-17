import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String name;
  final String assetPath;
  final bool isViewed;
  final bool isVideo;

  const StoryItem({
    super.key,
    required this.name,
    required this.assetPath,
    this.isViewed = false,
    this.isVideo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: CircleAvatar(
            radius: 32,
            backgroundColor: isViewed ? Colors.grey : Colors.green,
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  isVideo ? null : AssetImage(assetPath) as ImageProvider,
              child: isVideo
                  ? const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 30,
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
