import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/statusview_screen.dart';
import 'package:whatsapp_app/widgets/story_item.dart';

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
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => openStatus(
                        context, "Story 2", "assets/stories/story2.png"),
                    child: const StoryItem(
                      name: "Story 2",
                      assetPath: "assets/stories/story2.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                        context, "Video Story", "assets/stories/video1.mp4",
                        isVideo: true),
                    child: const StoryItem(
                      name: "Video Story",
                      assetPath: "assets/stories/video1.mp4",
                      isVideo: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                        context, "Story 3", "assets/stories/story3.jpeg"),
                    child: const StoryItem(
                      name: "Story 3",
                      assetPath: "assets/stories/story3.jpeg",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                        context, "Story 4", "assets/stories/story4.jpeg"),
                    child: const StoryItem(
                      name: "Story 4",
                      assetPath: "assets/stories/story4.jpeg",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                        context, "Story 5", "assets/stories/story5.jpeg"),
                    child: const StoryItem(
                      name: "Story 5",
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
