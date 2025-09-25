import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoursesBody extends StatelessWidget {
  const CoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hola, Juan', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                RachaWidget(icon: Icons.flash_on, text: "1 día de racha"),
              ],
            ),
            const SizedBox(height: 15),
            ProgressWidget(),
            const SizedBox(height: 25),
            CoursesWidget(),
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

class CoursesWidget extends StatefulWidget {
  const CoursesWidget({super.key});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  int selectedIndex = 0;

  final List<String> cursos = ['Todos los cursos', 'Curso A', 'Curso B', 'Curso C'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(label: 'Cursos', icon: Icons.error_outline),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cursos.length,
            itemBuilder: (context, index) {
              return CourseFilter(
                label: cursos[index],
                isActive: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    // aquí puedes filtrar tus datos según index
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        CourseCard(
          category: 'Finanzas Personales',
          title: 'Planificación de finanzas personales',
          description: 'Mejora tu situación y tu calidad de vida',
          rating: 4.7,
          reviews: 23000,
          imageUrl:
              'https://static.vecteezy.com/system/resources/thumbnails/008/695/917/small_2x/no-image-available-icon-simple-two-colors-template-for-no-image-or-picture-coming-soon-and-placeholder-illustration-isolated-on-white-background-vector.jpg',
        ),
      ],
    );
  }
}
