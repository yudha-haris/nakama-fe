import 'package:flutter/material.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        // TODO(Adeline): edit style
        brightness: Brightness.dark,
        // TODO(Adeline): Edit Style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple,
          )
        ),
        /* dark theme settings */
      ),
      // TODO(All): Kalau mau liat lightmode sama darkmode ganti di bawah
      themeMode: ThemeMode.dark,
      home: const LoginPage(),
    );
  }
}
