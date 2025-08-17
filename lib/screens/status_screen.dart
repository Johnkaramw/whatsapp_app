import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/statusview_screen.dart';

import '../widgets/story_item.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  void openStatus(BuildContext context, String name, String assetPath,
      {bool isVideo = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusViewScreen(
          name: name,
          assetPath: assetPath,
          isVideo: isVideo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Status")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Status
            ListTile(
              leading: Stack(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage("assets/stories/story1.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              title: const Text("My Status"),
              subtitle: const Text("Tap to add status update"),
              onTap: () => openStatus(
                context,
                "My Status",
                "assets/stories/story1.png",
              ),
            ),

            const Divider(),

            // Recent Updates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(
                "Recent updates",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "ساره",
                      "assets/stories/story2.png",
                    ),
                    child: const StoryItem(
                      name: "ساره",
                      assetPath: "assets/stories/story2.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "اندرو",
                      "assets/stories/video1.mp4",
                      isVideo: true,
                    ),
                    child: const StoryItem(
                      name: "اندرو",
                      assetPath: "assets/stories/video1.mp4",
                      isVideo: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "bebo",
                      "assets/stories/story3.jpeg",
                    ),
                    child: const StoryItem(
                      name: " bebo",
                      assetPath: "assets/stories/story3.jpeg",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "katy",
                      "assets/stories/story4.jpeg",
                    ),
                    child: const StoryItem(
                      name: "katy",
                      assetPath: "assets/stories/story4.jpeg",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "John karam",
                      "assets/stories/story5.jpeg",
                    ),
                    child: const StoryItem(
                      name: "John karam",
                      assetPath: "assets/stories/story5.jpeg",
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
}
