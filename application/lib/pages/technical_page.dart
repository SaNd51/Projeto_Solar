import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/botao_sign_in.dart';
import '../widgets/input_field.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';

class TecnicoPage extends StatefulWidget {
  const TecnicoPage({super.key});

  @override
  State<TecnicoPage> createState() => _TecnicoPage();
}

class _TecnicoPage extends State<TecnicoPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              
              //Campo User
              InputField(
                label: 'User',
                hint: 'Enter user',
                controller: userController,
              ),

              const SizedBox(height: 10),

              // Campo Password
              InputField(
                label: 'Password',
                hint: 'Enter password',
                obscure: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

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

              BotaoSignIn(
              onPressed: () async {
                final user = userController.text;
                final password = passwordController.text;

                final success = await AuthService.login(
                  user: user,
                  password: password,
                );

                if (success) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, AppRoutes.home);
                }
              },
            ),
            ],
          ),
        ),
      ),
    );
  }
  
}