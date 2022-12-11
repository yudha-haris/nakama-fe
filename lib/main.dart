import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ingatkan/features/authentication/view/presentation/login_page.dart';
import 'package:ingatkan/features/authentication/view/presentation/splash_screen.dart';
import 'package:ingatkan/services/shared_prefs.dart';
import 'package:provider/provider.dart';

import 'core/global/global_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs().init();

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
      builder: (context){
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          /* light theme settings */
          primaryColor: const Color.fromARGB(255, 247, 77, 94),
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 247, 77, 94),
          ),
          accentColor: Color.fromARGB(255, 252, 123, 77),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 252, 123, 77),
              )),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
          primaryColor: const Color.fromARGB(255, 120, 134, 238),
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 120, 134, 238), //<-- SEE HERE
          ),
          accentColor: Color.fromRGBO(179, 106, 251, 1),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(179, 106, 251, 1),
              )),
        ),
        // TODO(All): Kalau mau liat lightmode sama darkmode ganti di bawah
        themeMode: context
            .watch<GlobalState>()
            .themeMode,
        home: const SplashScreen(),
      );
    });
  }
}
