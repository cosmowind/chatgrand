import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('偏好设置')),
      body: const Center(
        child: Text('偏好设置页面'),
      ),
    );
  }
}
