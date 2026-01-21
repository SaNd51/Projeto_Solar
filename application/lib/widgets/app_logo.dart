import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  

  const AppLogo({
    super.key,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Image(
          image: AssetImage('../web/favicon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
