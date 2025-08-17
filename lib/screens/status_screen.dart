import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/statusview_screen.dart';
import '../widgets/story_item.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  void openStatus(BuildContext context, String name, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusViewScreen(name: name, imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Status")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // My Status
            ListTile(
              leading: Stack(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/300?img=10",
                    ),
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
                "https://i.pravatar.cc/300?img=10",
              ),
            ),

            const Divider(),

            // Recent Updates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent updates",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
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
                      "Ahmed",
                      "https://i.pravatar.cc/300?img=11",
                    ),
                    child: const StoryItem(
                      name: "Ahmed",
                      imageUrl: "https://i.pravatar.cc/300?img=11",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "Mona",
                      "https://i.pravatar.cc/300?img=12",
                    ),
                    child: const StoryItem(
                      name: "Mona",
                      imageUrl: "https://i.pravatar.cc/300?img=12",
                      isViewed: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "Omar",
                      "https://i.pravatar.cc/300?img=13",
                    ),
                    child: const StoryItem(
                      name: "Omar",
                      imageUrl: "https://i.pravatar.cc/300?img=13",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "Sara",
                      "https://i.pravatar.cc/300?img=14",
                    ),
                    child: const StoryItem(
                      name: "Sara",
                      imageUrl: "https://i.pravatar.cc/300?img=14",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => openStatus(
                      context,
                      "Mostafa",
                      "https://i.pravatar.cc/300?img=15",
                    ),
                    child: const StoryItem(
                      name: "Mostafa",
                      imageUrl: "https://i.pravatar.cc/300?img=15",
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
