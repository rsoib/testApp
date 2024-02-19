import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/src/presentation/pages/auth_page.dart';
import 'package:testapp/src/presentation/pages/main_page.dart';
import 'package:testapp/service_locator.dart' as di;
import 'package:testapp/src/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(BlocOverrides.runZoned(() => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/auth':
            return MaterialPageRoute(builder: (context) => const AuthPage());
          case '/main':
            return MaterialPageRoute(builder: (context) => MainPage());
          default:
            return null;
        }
      },
    );
  }
}


