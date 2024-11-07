class Elderly {
  final String id;
  final String name;
  final String gender;
  final String birthDate;
  final String avatar;
  final int relationDays;
  final bool hasNewDemand;
  final bool hasNewMessage;

  const Elderly({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
    this.avatar = '',
    this.relationDays = 0,
    this.hasNewDemand = false,
    this.hasNewMessage = false,
  });

  // 模拟数据
  static final Map<String, Elderly> mockData = {
    'father': Elderly(
      id: 'father',
      name: '张一鸣',
      gender: '男',
      birthDate: '1949年12月30日',
      relationDays: 180,
      hasNewDemand: true,
    ),
    'mother': Elderly(
      id: 'mother',
      name: '刘萍',
      gender: '女',
      birthDate: '1952年6月17日',
      relationDays: 180,
    ),
  };
}
