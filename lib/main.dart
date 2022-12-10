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
      title: 'Nakama',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
        primaryColor: Color.fromARGB(255, 247, 77, 94),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 247, 77, 94),
        ),
        accentColor: Color.fromARGB(255, 252, 123, 77),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 252, 123, 77),
        )),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
        primaryColor: Color.fromARGB(255, 120, 134, 238),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 120, 134, 238), //<-- SEE HERE
        ),
        accentColor: Color.fromRGBO(179, 106, 251, 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(179, 106, 251, 1),
        )),
      ),
      // TODO(All): Kalau mau liat lightmode sama darkmode ganti di bawah
      themeMode: ThemeMode.dark,
      home: const LoginPage(),
    );
  }
}
