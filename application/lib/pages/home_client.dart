import 'package:flutter/material.dart';
import '../widgets/bottom_navigattion_bar.dart';
import '../theme/theme_controller.dart';

class HomeClientPage extends StatefulWidget {
  const HomeClientPage({super.key, required this.userType});

  final String userType;

  @override
  State<HomeClientPage> createState() => _HomeClientPageState();
}

class _HomeClientPageState extends State<HomeClientPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color.fromARGB(220, 53, 52, 52),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Área do Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              ThemeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 365,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 206, 141, 56),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ícone
              const SizedBox(height: 30),
              Text(
                'Seja bem-vindo, cliente!',
                
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  // Botão Técnico / Cliente
}
