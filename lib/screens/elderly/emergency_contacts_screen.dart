import 'package:flutter/material.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('紧急联系人')),
      body: const Center(
        child: Text('紧急联系人页面'),
      ),
    );
  }
}
