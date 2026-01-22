import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _index = 0;
  
  final pages = [
    const Text(''),
    const Text(''),
    const Text(''),
  ];

  @override
    Widget build(BuildContext context) {
      return SizedBox(
          child: BottomNavigationBar(
          //unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          //backgroundColor: Color.fromARGB(108, 54, 54, 54),
          currentIndex: _index,
          iconSize: 30,
          onTap: (i) {
            setState(() => _index = i);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person_add_alt_outlined),label: '',),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ''),
          ],
        ),
      );
  }  
}