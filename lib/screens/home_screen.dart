import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/status_screen.dart';
import 'package:whatsapp_app/widgets/chat_tile.dart';

import '../models/chat.dart';
import '../models/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  late List<Chat> chats;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Mock data with profile images
    chats = [
      Chat(
        id: 'c1',
        name: 'Mariam',
        avatarImage: 'assets/stories/images1.png',
        messages: [
          Message(
            id: 'm1',
            text: 'Hey, are you free today?',
            time: DateTime.now().subtract(const Duration(minutes: 15)),
            type: MessageType.received,
          ),
          Message(
            id: 'm2',
            text: 'Yes, after 6pm!',
            time: DateTime.now().subtract(const Duration(minutes: 12)),
            type: MessageType.sent,
          ),
        ],
      ),
      Chat(
        id: 'c2',
        name: 'Ahmed',
        avatarImage: 'assets/stories/images2.png',
        messages: [
          Message(
            id: 'm3',
            text: 'Send the doc please',
            time: DateTime.now().subtract(const Duration(hours: 2)),
            type: MessageType.received,
          ),
        ],
      ),
      Chat(
        id: 'c3',
        name: 'Youssef',
        avatarImage: 'assets/stories/images3.png',
        messages: [
          Message(
            id: 'm4',
            text: 'Standup at 10:00',
            time: DateTime.now().subtract(const Duration(hours: 5)),
            type: MessageType.received,
          ),
          Message(
            id: 'm5',
            text: 'On my way',
            time: DateTime.now().subtract(
              const Duration(hours: 4, minutes: 50),
            ),
            type: MessageType.sent,
          ),
        ],
      ),
      Chat(
        id: 'c4',
        name: 'Sara',
        avatarImage: 'assets/stories/images4.png',
        messages: [],
      ),
      Chat(
        id: 'c5',
        name: 'Omar',
        avatarImage: 'assets/stories/images5.png',
        messages: [],
      ),
      Chat(
        id: 'c6',
        name: 'Laila',
        avatarImage: 'assets/stories/6.png',
        messages: [],
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Chats
          ListView.separated(
            itemCount: chats.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: Theme.of(context).dividerColor),
            itemBuilder: (context, index) => ChatTile(chat: chats[index]),
          ),
          // Status
          const StatusScreen(),
          // Calls placeholder
          const _CallsPlaceholder(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_bubble),
      ),
    );
  }
}

class _CallsPlaceholder extends StatelessWidget {
  const _CallsPlaceholder();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Calls screen (not required for task)',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
