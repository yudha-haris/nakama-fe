import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:provider/provider.dart';

import 'core/global/global_state.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider<GlobalState>(
          create: (_) => GlobalState(),
        )
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalState _globalState = GlobalState();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
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
          themeMode: context.watch<GlobalState>().themeMode,
          home: const LoginPage(),
        );
      }
    );
  }
}
