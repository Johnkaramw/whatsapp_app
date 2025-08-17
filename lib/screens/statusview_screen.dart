import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StatusViewScreen extends StatefulWidget {
  final String name;
  final String assetPath;
  final bool isVideo;

  const StatusViewScreen({
    super.key,
    required this.name,
    required this.assetPath,
    this.isVideo = false,
  });

  @override
  State<StatusViewScreen> createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _videoController = VideoPlayerController.asset(widget.assetPath)
        ..initialize().then((_) {
          setState(() {});
          _videoController?.play();
          _videoController?.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.name),
      ),
      body: Center(
        child: widget.isVideo
            ? (_videoController != null && _videoController!.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _videoController!.value.isPlaying
                            ? _videoController!.pause()
                            : _videoController!.play();
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _videoController!.value.aspectRatio,
                      child: VideoPlayer(_videoController!),
                    ),
                  )
                : const CircularProgressIndicator())
            : Image.asset(widget.assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
