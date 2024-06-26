import 'package:flutter/material.dart';

class NotificationViewPage extends StatelessWidget {
  const NotificationViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: const Center(child: Text('Notification Not Found')),
    );
  }
}
