import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 微信登录按钮
            ElevatedButton.icon(
              onPressed: () {
                // TODO: 实现微信登录
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              },
              icon: const Icon(Icons.wechat, color: Colors.green),
              label: const Text('微信一键登录'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // 支付宝登录按钮
            ElevatedButton.icon(
              onPressed: () {
                // TODO: 实现支付宝登录
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              },
              icon:
                  const Icon(Icons.account_balance_wallet, color: Colors.blue),
              label: const Text('支付宝一键登录'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // 手机号登录按钮
            ElevatedButton.icon(
              onPressed: () {
                // TODO: 实现手机号登录
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              },
              icon: const Icon(Icons.phone_android, color: Colors.orange),
              label: const Text('手机号一键登录'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Face ID登录按钮
            if (Theme.of(context).platform == TargetPlatform.iOS)
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: 实现Face ID登录
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/dashboard',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.face, color: Colors.purple),
                label: const Text('Face ID登录'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                ),
              ),

            const SizedBox(height: 32),
            // 隐私政策提示
            const Text(
              '登录即代表您同意《用户协议》和《隐私政策》',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
