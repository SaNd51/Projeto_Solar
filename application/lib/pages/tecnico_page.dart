import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/botao_sign_in.dart';
import '../widgets/input_field.dart';


class TecnicoPage extends StatelessWidget {
  const TecnicoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 135, 72),
      appBar: AppBar(title: Text('Área do Técnico'), shadowColor: Colors.orange),
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
                'Bem-vindo Técnico!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),                    

              // Campo User
              InputField(label: 'User', hint: 'Enter user'),

              const SizedBox(height: 16),

              // Campo Password
              InputField(
                label: 'Password',
                hint: 'Enter password',
                obscure: true,
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget account?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const BotaoSignIn(),
            ],
          ),
        ),
      ),
    );
  }
  
}