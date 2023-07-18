import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:virtual_assistant/action/app_action.dart';
import 'package:virtual_assistant/action/student/student_action.dart';
import 'package:virtual_assistant/action/user/user_action.dart';
import 'package:virtual_assistant/forms.dart';
import 'package:virtual_assistant/model/notificationlist.dart';
import 'package:virtual_assistant/screen/auth/register/register_page.dart';
import 'package:virtual_assistant/screen/Suggested_Schedule/register_year.dart';
import 'package:virtual_assistant/screen/auth/register/step_one_register.dart';
import 'package:virtual_assistant/screen/cs_plan/first_year.dart';
import 'package:virtual_assistant/screen/dashboard/dashboard.dart';
import 'package:virtual_assistant/screen/profile/profile.dart';
import 'package:virtual_assistant/screen/reminder/event.dart';
import 'package:virtual_assistant/screen/splash_screen.dart';
import 'package:virtual_assistant/screen/std_notification.dart';
import 'package:virtual_assistant/take_quiz.dart';

import 'screen/search_location/searchPage.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppAction()),
        ChangeNotifierProvider(create: (_) => UserAction()),
        ChangeNotifierProvider(create: (_) => StudentAction()),
        
      ],
      child: UopApp(),
    ),
  );
}

class UopApp extends StatelessWidget {
  UopApp({Key? key}) : super(key: key);
  final notlist kk = new notlist("title", "content");
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UOP Virtual Assistant',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
          initialRoute: '/',
          routes: {
            '/notification': (context) => const std_notificatio(),
            '/quiz': (context) => const TakeQuiz(),
            '/map': (context) => const Search(),
            '/calendar': (context) => const EventPage(),
            '/plan': (context) => const Firstyear(),
            '/paperwork': (context) => const Forms(),
            '/profile': (context) => const ProfilePage(),
            '/dashboard': (context) => const Dashboard(),
          },
        );
      },
      child: const std_notificatio(),
    );
  }
}
