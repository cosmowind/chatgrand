import 'package:flutter/material.dart';
import '../../models/elderly.dart';
import '../../models/daily_greeting.dart';

class DailyGreetingScreen extends StatelessWidget {
  final String elderlyId;

  const DailyGreetingScreen({
    super.key,
    required this.elderlyId,
  });

  Widget _buildGreetingItem(DailyGreeting greeting) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧头像
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.person_outline, color: Colors.grey),
          ),
          const SizedBox(width: 12),

          // 右侧内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _getGreetingTitle(greeting.time),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (greeting.hasWarning)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.warning_amber,
                          size: 16,
                          color: Colors.orange,
                        ),
                      ),
                    const Spacer(),
                    Text(
                      greeting.time,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  greeting.content,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getGreetingTitle(String time) {
    final hour = int.parse(time.split(':')[0]);
    if (hour < 10) return '早晨问候';
    if (hour < 14) return '中午问候';
    if (hour < 18) return '下午问候';
    return '晚间问候';
  }

  @override
  Widget build(BuildContext context) {
    final elderly = Elderly.mockData[elderlyId]!;
    final greetings = DailyGreeting.mockData[elderlyId] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${elderly.name}每日问候总结'),
      ),
      body: ListView.separated(
        itemCount: greetings.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) => _buildGreetingItem(greetings[index]),
      ),
    );
  }
}
