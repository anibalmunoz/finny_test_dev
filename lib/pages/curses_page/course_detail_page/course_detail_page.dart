import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/pages/favorites_page/favorite_button.dart';
import 'package:finny_test_dev/widgets/module_widget.dart';
import 'package:finny_test_dev/widgets/user_avatar.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CourseDetailPage extends StatelessWidget {
  final CategoryModel category;
  final Module course;
  const CourseDetailPage({super.key, required this.course, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8F8),
        centerTitle: true,
        title: Text('Detalle del curso', style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: course.socialImageUrl != null
                    ? Image.network(course.socialImageUrl!, fit: BoxFit.cover)
                    : Center(
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                        ),
                      ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(category: category),
                  FavoriteButton(course: course),
                ],
              ),
              const SizedBox(height: 15),
              Text(course.title ?? '', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              if (course.subjects != null && course.subjects!.isNotEmpty)
                Text(formatSubjects(course.subjects), style: TextStyle(fontSize: 16, color: Color(0xFF6D7280))),
              const SizedBox(height: 5),
              Row(
                children: [
                  Image.asset('assets/icons/time.png'),
                  const SizedBox(width: 10),
                  Text('${course.numberOfChildren} Módulos'),
                  const SizedBox(width: 20),
                  Image.asset('assets/icons/clock-five.png'),
                  const SizedBox(width: 10),
                  Text('${formatMinutesToHours(course.durationInMinutes ?? 0)} '),
                ],
              ),
              const SizedBox(height: 20),
              Text('Descripción', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              ReadMoreText(
                course.summary ?? '',
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Leer más',
                trimExpandedText: ' Leer menos',
                style: TextStyle(fontSize: 16, color: Color(0xFF6D7280)),
                moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFAE55EE)),
                lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFAE55EE)),
              ),
              const SizedBox(height: 20),
              UserAvatar(name: 'Krishna Todelo', position: 'CEO Finny', asset: 'assets/images/image-4.png'),
              const SizedBox(height: 20),
              CustomLabel(label: 'Módulos', icon: Icons.error_outline),
              const SizedBox(height: 20),
              if (course.units != null && course.units!.isNotEmpty)
                ...course.units!.map((unit) => ModuleWidget(title: getModuleName(unit))),
            ],
          ),
        ),
      ),
    );
  }

  String formatMinutesToHours(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (hours > 0) {
      return remainingMinutes > 0 ? '$hours horas $remainingMinutes minutos' : '$hours horas';
    } else {
      return '$remainingMinutes minutos';
    }
  }

  String formatSubjects(List<String>? subjects) {
    if (subjects == null || subjects.isEmpty) return '';
    final first = subjects.first;
    final capitalizedFirst = first[0].toUpperCase() + first.substring(1);
    final rest = subjects.skip(1).join(', ');
    final subject = rest.isNotEmpty ? '$capitalizedFirst, $rest' : capitalizedFirst;
    return subject.replaceAll('-', ' ');
  }

  String getModuleName(String original) {
    int lastDot = original.lastIndexOf('.');
    String name = (lastDot != -1) ? original.substring(lastDot + 1) : original;
    name = name.replaceAll('-', ' ');
    if (name.isNotEmpty) {
      name = name[0].toUpperCase() + name.substring(1);
    }
    return name;
  }
}
