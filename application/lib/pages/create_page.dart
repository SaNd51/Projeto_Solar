import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/botao_sign_in.dart';
import '../widgets/input_field.dart';
import '../services/create_service.dart';
import '../routes/app_routes.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 135, 72),
      appBar: AppBar(title: Text('Criar Conta'), shadowColor: Colors.orange),
      body: Center(
        child: Container(
          width: 365,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Ícone
              const AppLogo(),

              const SizedBox(height: 30),

              const Text(
                'Crie uma conta',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              const SizedBox(height: 10),

              // Campo User
              InputField(
                label: 'User',
                hint: 'Enter user',
                controller: userController,
              ),

              const SizedBox(height: 10),

              // Campo Email
              InputField(
                label: 'Email',
                hint: 'Enter e-mail',
                controller: emailController,
              ),

              const SizedBox(height: 10),
              // Campo Password
              InputField(
                label: 'Password',
                hint: 'Enter password',
                obscure: true,
                controller: passwordController,
              ),

              const SizedBox(height: 20),

              BotaoSignIn(
                onPressed: () async {
                  final user = userController.text.trim();
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (user.isEmpty || email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha todos os campos.'),
                      ),
                    );
                    return;
                  }

                  final result = await AuthService.create(
                    user: user,
                    email: email,
                    password: password,
                  );

                  if (result['success'] == true) {
                    if (!mounted) return;
                    Navigator.pushNamed(
                      context,
                      arguments: 'cliente',
                      AppRoutes.homeClient,
                    );
                  } else {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          result['message']?.toString() ??
                              'Falha ao criar conta na API.',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
}
