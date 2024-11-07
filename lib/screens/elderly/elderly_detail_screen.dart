import 'package:flutter/material.dart';
import '../../models/elderly.dart';

class ElderlyDetailScreen extends StatelessWidget {
  final String elderlyId;

  const ElderlyDetailScreen({
    super.key,
    required this.elderlyId,
  });

  Widget _buildInfoItem({
    required String label,
    required String value,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String title,
    required VoidCallback? onTap,
    bool enabled = true,
  }) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
          color: enabled ? Colors.white : Colors.grey[50],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: enabled ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: enabled ? Colors.black87 : Colors.grey,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: enabled ? Colors.grey[600] : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final elderly = Elderly.mockData[elderlyId]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('${elderly.name}的资料'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: 实现编辑功能
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 头像区域
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: elderly.avatar.isEmpty
                        ? const AssetImage('assets/images/default_avatar.png')
                        : AssetImage(elderly.avatar),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        elderly.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '已关联 ${elderly.relationDays} 天',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 基本信息
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  _buildInfoItem(label: '姓名', value: elderly.name),
                  _buildInfoItem(label: '性别', value: elderly.gender),
                  _buildInfoItem(
                    label: '生日',
                    value: elderly.birthDate,
                    showDivider: false,
                  ),
                ],
              ),
            ),

            // 功能导航区域
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildNavigationItem(
                    icon: Icons.favorite,
                    title: '健康资料',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/elderly/health',
                      arguments: elderlyId,
                    ),
                    enabled: false,
                  ),
                  const SizedBox(height: 12),
                  _buildNavigationItem(
                    icon: Icons.location_on,
                    title: '地址管理',
                    onTap: null,
                    enabled: false,
                  ),
                  const SizedBox(height: 12),
                  _buildNavigationItem(
                    icon: Icons.message,
                    title: '家属信息',
                    onTap: null,
                    enabled: false,
                  ),
                  const SizedBox(height: 12),
                  _buildNavigationItem(
                    icon: Icons.warning,
                    title: '每天关顾',
                    onTap: null,
                    enabled: false,
                  ),
                  const SizedBox(height: 12),
                  _buildNavigationItem(
                    icon: Icons.calendar_today,
                    title: '每日问候',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/elderly/daily-greeting',
                      arguments: elderlyId,
                    ),
                    enabled: true,
                  ),
                  const SizedBox(height: 12),
                  _buildNavigationItem(
                    icon: Icons.assignment_outlined,
                    title: '需求管理',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/elderly/demand',
                      arguments: elderlyId,
                    ),
                    enabled: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
