import 'package:flutter/material.dart';

class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('用药管理')),
      body: const Center(
        child: Text('用药管理页面'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/elderly/medications/reminder');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
