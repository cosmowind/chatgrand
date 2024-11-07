import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    try {
      rootBundle.load('assets/images/background_main_page.png').then((_) {
        print('Asset loaded successfully');
      });
    } catch (e) {
      print('Asset loading error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // 首页
      SingleChildScrollView(
        child: Column(
          children: [
            // 顶部提示条
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.orange[100],
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange),
                  const SizedBox(width: 8),
                  const Text('您的父亲有一条需求信息待查看'),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.grey[600]),
                ],
              ),
            ),

            // 主要内容区域
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '首页',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 背景图片
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/background_main_page.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        print('Error loading image: $error');
                        // 加载失败时显示占位内容
                        return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 今日总结标题
                  const Text(
                    '今日总结',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 三个功能按钮
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFunctionButton(
                        icon: Icons.favorite_border,
                        label: '健康',
                        onTap: () {},
                      ),
                      _buildFunctionButton(
                        icon: Icons.access_time,
                        label: '回顾',
                        onTap: () {},
                      ),
                      _buildFunctionButton(
                        icon: Icons.help_outline,
                        label: '需求',
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 父亲和母亲的入口
                  Row(
                    children: [
                      Expanded(
                        child: _buildParentCard(
                          title: '父亲',
                          subtitle: '点击进入父亲页面',
                          hasNotification: true,
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/elderly/detail',
                            arguments: 'father',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildParentCard(
                          title: '母亲',
                          subtitle: '点击进入母亲页面',
                          hasNotification: false,
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/elderly/detail',
                            arguments: 'mother',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // 个人中心
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('主面板')),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }

  // 功能按钮组件
  Widget _buildFunctionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }

  // 父母卡片组件
  Widget _buildParentCard({
    required String title,
    required String subtitle,
    required bool hasNotification,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.person_outline),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (hasNotification)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
