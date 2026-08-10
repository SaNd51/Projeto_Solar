import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/technical_page.dart';
import '../pages/client_page.dart';
import '../pages/create_page.dart';
import '../pages/home_client.dart';
import '../pages/home_technical.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.technical: (context) => const TechnicalPage(),
    AppRoutes.client: (context) => const ClientPage(),
    AppRoutes.create: (context) => const CreatePage(),
    // AppRoutes.home: (context) => const HomePage(userType: 'cliente'),
    AppRoutes.homeTechnical: (context) => const HomeTechnicalPage(userType: 'tecnico'),
    AppRoutes.homeClient: (context) => const HomeClientPage(userType: 'cliente'),
  };
}
