import 'package:flutter/material.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.themeMode,
      builder: (context, ThemeMode mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.login,
          routes: AppPages.routes,

          // 👇 tema claro
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
          ),

          // 👇 tema escuro
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
          ),

          // 👇 controla o tema atual
          themeMode: mode,
        );
      },
    );
  }
}
