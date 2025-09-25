import 'package:flutter/material.dart';

class ConstructionBody extends StatelessWidget {
  const ConstructionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.build, size: 50),
          Text(
            '¡Ups! Estamos en construcción, vuelve pronto',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
