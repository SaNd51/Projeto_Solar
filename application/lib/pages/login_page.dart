import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../routes/app_routes.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 135, 72),
      body: Center(
        child: Container(
          width: 365,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ícone
              const AppLogo(),
              const SizedBox(height: 30),
              const Text(
                'Seja bem-vindo!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                'Selecione o tipo de usuário que deseja entrar',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // Botões Técnico / Cliente
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.tecnico);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 235, 233, 233),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),),
                    child: _userTypeButton(icon: Icons.build, label: 'Técnico', ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.cliente);
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 235, 233, 233),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),),
                    child: _userTypeButton(
                      icon: Icons.person,
                      label: 'Cliente',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.create);
                  },
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Botão Técnico / Cliente
  static Widget _userTypeButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      height: 44,
      width: 100,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Color.fromARGB(255, 70, 61, 61)),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: Color.fromARGB(255, 70, 61, 61))),
          
        ],
      ),
    );
  }
}
