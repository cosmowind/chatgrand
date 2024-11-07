import 'package:flutter/material.dart';

class MedHistoryScreen extends StatelessWidget {
  const MedHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用药记录')),
      body: const Center(
        child: Text('用药记录页面'),
      ),
    );
  }
}
