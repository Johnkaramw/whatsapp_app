import 'package:flutter/material.dart';
import '../widgets/story_item.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stories"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: const [
          StoryItem(
            name: "Your Story",
            imageUrl: "https://via.placeholder.com/150",
            isViewed: false,
          ),
          StoryItem(
            name: "Ahmed",
            imageUrl: "https://via.placeholder.com/150/00FF00",
            isViewed: true,
          ),
          StoryItem(
            name: "Mona",
            imageUrl: "https://via.placeholder.com/150/FF0000",
            isViewed: false,
          ),
        ],
      ),
    );
  }
}

/// Alias for backward compatibility
/// لو كاتب StatusScreen بدل StoriesScreen مش هيعمل Error
class StatusScreen extends StoriesScreen {
  const StatusScreen({super.key});
}
