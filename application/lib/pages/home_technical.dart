import 'package:flutter/material.dart';
import '../widgets/bottom_navigattion_bar.dart';
import '../theme/theme_controller.dart';

class HomeTechnicalPage extends StatefulWidget {
  const HomeTechnicalPage({super.key, required this.userType});

  final String userType;

  @override
  State<HomeTechnicalPage> createState() => _HomeTechnicalPageState();
}

class _HomeTechnicalPageState extends State<HomeTechnicalPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color.fromARGB(220, 53, 52, 52),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Área do Técnico'),
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
                'Seja bem-vindo, tecnico!',
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
