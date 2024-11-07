import 'package:flutter/material.dart';
import '../../models/elderly.dart';

class HealthRecordsScreen extends StatelessWidget {
  final String elderlyId;

  const HealthRecordsScreen({
    super.key,
    required this.elderlyId,
  });

  @override
  Widget build(BuildContext context) {
    final elderly = Elderly.mockData[elderlyId]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${elderly.name}的健康记录'),
      ),
      body: const Center(
        child: Text('健康记录页面'),
      ),
    );
  }
}
