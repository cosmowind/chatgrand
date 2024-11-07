import 'package:flutter/material.dart';
import '../../models/elderly.dart';

class DemandInfoScreen extends StatelessWidget {
  final String elderlyId;

  const DemandInfoScreen({
    super.key,
    required this.elderlyId,
  });

  Widget _buildDemandItem() {
    final elderly = Elderly.mockData[elderlyId]!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '生活用品需求',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '待处理',
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '12:30',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${elderly.name}的家中用品已用完了，需要采购。',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final elderly = Elderly.mockData[elderlyId]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${elderly.name}的需求信息'),
      ),
      body: ListView(
        children: [
          _buildDemandItem(),
          _buildDemandItem(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 添加新需求
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
