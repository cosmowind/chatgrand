import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildListTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color? iconColor,
    bool showDivider = true,
  }) {
    final bool isEnabled = onTap != null;

    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: iconColor ?? (isEnabled ? Colors.black54 : Colors.grey),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isEnabled ? Colors.black : Colors.grey, // 禁用状态文字置灰
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: isEnabled
                ? Colors.grey
                : Colors.grey.withOpacity(0.5), // 禁用状态箭头更淡
          ),
          onTap: onTap,
          enabled: isEnabled, // 设置禁用状态
        ),
        if (showDivider) const Divider(height: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 用户基本信息区域
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // 头像
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        const AssetImage('assets/images/default_figure.png'),
                  ),
                  const SizedBox(width: 20),
                  // 用户信息
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '用户昵称',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'ID: 888888',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 虚拟形象区域
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Image.asset(
                'assets/images/default_avatar.png',
                fit: BoxFit.contain,
              ),
            ),

            // 设置选项列表
            _buildListTile(
              icon: Icons.person_outline,
              title: '个人资料',
              onTap: () {
                Navigator.pushNamed(context, '/profile/edit');
              },
              iconColor: Theme.of(context).primaryColor,
            ),
            _buildListTile(
              icon: Icons.notifications_none,
              title: '消息通知',
              onTap: null,
              iconColor: Colors.grey,
            ),
            _buildListTile(
              icon: Icons.security,
              title: '账号安全',
              onTap: null,
              iconColor: Colors.grey,
            ),
            _buildListTile(
              icon: Icons.settings_outlined,
              title: '通用设置',
              onTap: null,
              iconColor: Colors.grey,
            ),
            _buildListTile(
              icon: Icons.help_outline,
              title: '帮助与反馈',
              onTap: null,
              iconColor: Colors.grey,
            ),
            _buildListTile(
              icon: Icons.info_outline,
              title: '关于我们',
              onTap: null,
              iconColor: Colors.grey,
            ),

            // 退出登录按钮
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // 显示确认对话框
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('确认退出'),
                      content: const Text('确定要退出登录吗？'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('取消'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // 关闭对话框
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login',
                              (route) => false,
                            );
                          },
                          child: const Text('确定'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('退出登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 火柴人绘制器
class StickFigurePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);

    // 画头
    canvas.drawCircle(center.translate(0, -30), 15, paint);

    // 画身体
    canvas.drawLine(
      center.translate(0, -15),
      center.translate(0, 30),
      paint,
    );

    // 画手
    canvas.drawLine(
      center.translate(0, 0),
      center.translate(-25, -10),
      paint,
    );
    canvas.drawLine(
      center.translate(0, 0),
      center.translate(25, -10),
      paint,
    );

    // 画腿
    canvas.drawLine(
      center.translate(0, 30),
      center.translate(-20, 60),
      paint,
    );
    canvas.drawLine(
      center.translate(0, 30),
      center.translate(20, 60),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
