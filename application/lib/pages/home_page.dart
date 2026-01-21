import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Usuário' ), 
        shadowColor: const Color.fromARGB(255, 34, 34, 34),
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
              const Text(
                'Seja bem-vindo!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
              ),

              const SizedBox(height: 30),
            ]
          ),
        ),      
      ),
    );
  }

  // Botão Técnico / Cliente
}
