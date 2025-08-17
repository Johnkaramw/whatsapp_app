import 'dart:async';
import 'package:flutter/material.dart';

class StoryViewer extends StatefulWidget {
  final List<String> stories; // صور متعددة
  final String name;

  const StoryViewer({super.key, required this.stories, required this.name});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  int _currentIndex = 0;
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    _progress = 0.0;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _progress += 0.05; // سرعة كل ستوري
      });

      if (_progress >= 1.0) {
        if (_currentIndex < widget.stories.length - 1) {
          // روح للستوري اللي بعدها
          setState(() {
            _currentIndex++;
          });
          _startProgress();
        } else {
          // خلصت كل الستوري → ارجع
          _timer?.cancel();
          Navigator.pop(context);
        }
      }
    });
  }

  void _onTapDown(TapDownDetails details, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (details.globalPosition.dx < screenWidth / 2) {
      // رجوع لستوري قبلها
      if (_currentIndex > 0) {
        setState(() {
          _currentIndex--;
        });
        _startProgress();
      }
    } else {
      // تقديم لستوري بعدها
      if (_currentIndex < widget.stories.length - 1) {
        setState(() {
          _currentIndex++;
        });
        _startProgress();
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details, context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // صورة الستوري الحالية
            Positioned.fill(
              child: Image.network(
                widget.stories[_currentIndex],
                fit: BoxFit.cover,
              ),
            ),

            // progress indicators لكل ستوري
            Positioned(
              top: 40,
              left: 10,
              right: 10,
              child: Row(
                children: widget.stories.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: LinearProgressIndicator(
                        value: index == _currentIndex
                            ? _progress
                            : (index < _currentIndex ? 1.0 : 0.0),
                        backgroundColor: Colors.white24,
                        color: Colors.teal,
                        minHeight: 4,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // اسم الشخص
            Positioned(
              top: 60,
              left: 15,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
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
