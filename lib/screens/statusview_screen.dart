import 'package:flutter/material.dart';

class StatusViewScreen extends StatelessWidget {
  final String name;
  final String imageUrl;

  const StatusViewScreen({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
