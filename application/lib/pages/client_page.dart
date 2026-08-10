import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import '../widgets/botao_sign_in.dart';
import '../widgets/input_field.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPage();
}

class _ClientPage extends State<ClientPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 135, 72),
      appBar: AppBar(
        title: Text('Área do Cliente'),
        shadowColor: Colors.orange,
      ),
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
                'Bem-vindo Cliente!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              const SizedBox(height: 10),

              // Campo User
              InputField(
                label: 'email',
                hint: 'Enter email',
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

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              BotaoSignIn(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha email e senha.')),
                    );
                    return;
                  }

                  final result = await AuthService.login(
                    email: email,
                    password: password,
                  );

                  if (result['success'] == true) {
                    if (!mounted) return;
                    final tipoAcesso = result['tipoAcesso'];
                    final destino = tipoAcesso == 'tecnico'
                        ? AppRoutes.homeTechnical
                        : tipoAcesso == 'cliente'
                            ? AppRoutes.homeClient
                            : null;

                    if (destino == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tipo de acesso inválido.')),
                      );
                      return;
                    }

                    Navigator.pushReplacementNamed(
                      // ignore: use_build_context_synchronously
                      context,
                      destino,
                    );
                  } else {
                    if (!mounted) return;
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          result['message']?.toString() ??
                              'Falha ao conectar com a API.',
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
