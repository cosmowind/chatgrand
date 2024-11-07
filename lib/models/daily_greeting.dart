class DailyGreeting {
  final String id;
  final String elderlyId;
  final String time;
  final String content;
  final bool hasWarning;

  const DailyGreeting({
    required this.id,
    required this.elderlyId,
    required this.time,
    required this.content,
    this.hasWarning = false,
  });

  // 模拟数据
  static final Map<String, List<DailyGreeting>> mockData = {
    'father': [
      DailyGreeting(
        id: '1',
        elderlyId: 'father',
        time: '07:30',
        content: '身体状态良好，昨晚睡眠舒适',
      ),
      DailyGreeting(
        id: '2',
        elderlyId: 'father',
        time: '12:30',
        content: '在家休息，吃了红烧黄鱼，胃口不错',
        hasWarning: true,
      ),
      DailyGreeting(
        id: '3',
        elderlyId: 'father',
        time: '16:30',
        content: '在家看电视，和邻居聊天',
      ),
      DailyGreeting(
        id: '4',
        elderlyId: 'father',
        time: '20:30',
        content: '在家看电视，精神饱满，无不适',
      ),
    ],
    'mother': [
      DailyGreeting(
        id: '1',
        elderlyId: 'mother',
        time: '07:30',
        content: '身体状态良好，吃了高血压药，无不适',
      ),
      DailyGreeting(
        id: '2',
        elderlyId: 'mother',
        time: '12:30',
        content: '去园林吃午餐，准备午睡',
      ),
      DailyGreeting(
        id: '3',
        elderlyId: 'mother',
        time: '16:30',
        content: '去公园散心，和朋友聊天，走了六千步',
      ),
      DailyGreeting(
        id: '4',
        elderlyId: 'mother',
        time: '20:30',
        content: '在小区遛了广场舞，准备睡觉',
      ),
    ],
  };
}
