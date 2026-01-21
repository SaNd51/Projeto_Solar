import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/tecnico_page.dart';
import '../pages/cliente_page.dart';
import '../pages/create_page.dart';
import '../pages/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.tecnico: (context) => const TecnicoPage(),
    AppRoutes.cliente: (context) => const ClientePage(),
    AppRoutes.create: (context) => const CreatePage(),
    AppRoutes.home: (context) => const HomePage(),
  };
}
