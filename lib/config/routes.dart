import 'package:flutter/material.dart';

// 导入所有页面
import '../screens/auth/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/elderly/elderly_list_screen.dart';
import '../screens/elderly/elderly_detail_screen.dart';

// 继续创建其他页面的占位文件，然后导入
import '../screens/elderly/health_records_screen.dart';
import '../screens/elderly/health_stats_screen.dart';
import '../screens/elderly/medications_screen.dart';
import '../screens/elderly/med_reminder_screen.dart';
import '../screens/elderly/med_history_screen.dart';
import '../screens/elderly/daily_checks_screen.dart';
import '../screens/elderly/emergency_contacts_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/preferences_screen.dart';
import '../screens/profile/profile_edit_screen.dart';
import '../screens/elderly/demand_info_screen.dart';
import '../screens/elderly/daily_greeting_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // 认证路由
  '/splash': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),

  // 主面板路由
  '/dashboard': (context) => const DashboardScreen(),
  '/elderly/list': (context) => const ElderlyListScreen(),
  '/elderly/detail': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return ElderlyDetailScreen(elderlyId: args ?? 'father');
  },

  // 健康管理路由
  '/elderly/health': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return HealthRecordsScreen(elderlyId: args ?? 'father');
  },

  // 用药管理路由
  '/elderly/medications': (context) => const MedicationsScreen(),
  '/elderly/medications/reminder': (context) => const MedReminderScreen(),
  '/elderly/medications/history': (context) => const MedHistoryScreen(),

  // 检查管理路由
  '/elderly/daily-checks': (context) => const DailyChecksScreen(),
  '/elderly/emergency-contacts': (context) => const EmergencyContactsScreen(),

  // 设置路由
  '/profile': (context) => const ProfileScreen(),
  '/settings': (context) => const SettingsScreen(),
  '/preferences': (context) => const PreferencesScreen(),
  '/profile/edit': (context) => const ProfileEditScreen(),
  '/elderly/demand': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return DemandInfoScreen(elderlyId: args ?? 'father');
  },
  '/elderly/daily-greeting': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    return DailyGreetingScreen(elderlyId: args ?? 'father');
  },
};
