import 'package:flutter/material.dart';

class HealthStatsScreen extends StatelessWidget {
  const HealthStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('健康统计')),
      body: const Center(
        child: Text('健康统计页面'),
      ),
    );
  }
}
