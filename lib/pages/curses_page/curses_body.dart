import 'package:finny_test_dev/pages/curses_page/courses_widget.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoursesBody extends StatefulWidget {
  const CoursesBody({super.key});

  @override
  State<CoursesBody> createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hola, Juan', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                RachaWidget(assetIcon: 'assets/icons/flashlight-fill.png', text: "1 día de racha"),
              ],
            ),
            const SizedBox(height: 15),
            ProgressWidget(),
            const SizedBox(height: 25),
            CoursesWidget(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLabel(label: 'Tu progreso', icon: Icons.error_outline),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProgressSquare(quantity: '20', label: 'Cursos'),
            ProgressSquare(quantity: '2', label: 'En curso'),
            ProgressSquare(quantity: '9', label: 'Completos'),
            ProgressSquare(quantity: '4', label: 'Sin iniciar'),
          ],
        ),
      ],
    );
  }
}
