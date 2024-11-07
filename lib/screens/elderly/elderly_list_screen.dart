import 'package:flutter/material.dart';

class ElderlyListScreen extends StatelessWidget {
  const ElderlyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('老人列表')),
      body: const Center(
        child: Text('老人列表页面'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 跳转到添加老人页面
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
