import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool _isRecording = false;
  double _recordingProgress = 0.0;
  String _recordingStatus = '点击开始录音';
  final String _sampleText = '常回家看看，回家看看。叠个千纸鹤，再系个红飘带。忙，都忙，忙点好啊。宫廷御宴酒，一百八一杯。';

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordingStatus = '正在录音...';
    });

    // 模拟录音进度
    Future.delayed(const Duration(milliseconds: 100), () {
      _simulateRecording();
    });
  }

  void _simulateRecording() {
    if (_recordingProgress < 1.0) {
      setState(() {
        _recordingProgress += 0.01;
      });
      Future.delayed(const Duration(milliseconds: 50), _simulateRecording);
    } else {
      setState(() {
        _isRecording = false;
        _recordingProgress = 0.0;
        _recordingStatus = '录音完成';
      });
      // 显示完成提示
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('音频已保存')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑个人资料'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('保存'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头像设置
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, size: 18),
                        color: Colors.white,
                        onPressed: () {
                          // TODO: 实现头像上传
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 基本信息表单
            const TextField(
              decoration: InputDecoration(
                labelText: '昵称',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const TextField(
              decoration: InputDecoration(
                labelText: '个性签名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            // 音频录制部分
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '语音介绍',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '示范文本：$_sampleText',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  if (_isRecording)
                    Column(
                      children: [
                        LinearProgressIndicator(value: _recordingProgress),
                        const SizedBox(height: 8),
                        Text(_recordingStatus),
                      ],
                    ),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _isRecording ? null : _startRecording,
                      icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                      label: Text(_isRecording ? '录音中...' : '开始录音'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
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
