import 'package:flutter/material.dart';

class DailyChecksScreen extends StatelessWidget {
  const DailyChecksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('每日检查')),
      body: const Center(
        child: Text('每日检查页面'),
      ),
    );
  }
}
