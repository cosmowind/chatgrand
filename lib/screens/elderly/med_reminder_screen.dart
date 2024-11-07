import 'package:flutter/material.dart';

class MedReminderScreen extends StatelessWidget {
  const MedReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用药提醒')),
      body: const Center(
        child: Text('用药提醒页面'),
      ),
    );
  }
}
