import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final bool showText;
  final String? text;
  const LoadingWidget({super.key, this.color, this.showText = true, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(backgroundColor: color),
          if (showText) Text(text ?? 'Cargando...', style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
