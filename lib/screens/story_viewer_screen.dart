import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoryViewerScreen extends StatefulWidget {
  final String path; // مسار الصورة أو الفيديو
  final bool isVideo; // علشان نعرف ده فيديو ولا صورة

  const StoryViewerScreen({
    super.key,
    required this.path,
    required this.isVideo,
  });

  @override
  State<StoryViewerScreen> createState() => _StoryViewerScreenState();
}

class _StoryViewerScreenState extends State<StoryViewerScreen> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _videoController = VideoPlayerController.asset(widget.path)
        ..initialize().then((_) {
          setState(() {});
        });
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: true,
        looping: false,
        showControls: true,
        aspectRatio: _videoController!.value.aspectRatio,
      );
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: widget.isVideo
            ? (_chewieController != null &&
                    _chewieController!
                        .videoPlayerController.value.isInitialized)
                ? SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover, // الفيديو يغطي كامل الشاشة
                      child: SizedBox(
                        width: _videoController!.value.size.width,
                        height: _videoController!.value.size.height,
                        child: Chewie(controller: _chewieController!),
                      ),
                    ),
                  )
                : const CircularProgressIndicator(color: Colors.white)
            : SizedBox.expand(
                child: Image.asset(
                  widget.path,
                  fit: BoxFit.cover, // الصورة تغطي كامل الشاشة
                ),
              ),
      ),
    );
  }
}
