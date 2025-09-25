import 'package:finny_test_dev/providers/courses_provider.dart';
import 'package:finny_test_dev/services/course_service.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CoursesWidget extends StatelessWidget {
  final ScrollController scrollController;

  const CoursesWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = CoursesProvider();
        provider.loadCourses();

        scrollController.addListener(() {
          if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
            provider.loadMore();
          }
        });
        return provider;
      },
      child: Consumer<CoursesProvider>(
        builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabel(label: 'Cursos', icon: Icons.error_outline),
                  IconButton(
                    onPressed: () async {
                      if (provider.isFiltered) {
                        provider.clearFilter();
                      } else {
                        final filteredData = await showSearchCoursesDialog(context: context, courses: provider.courses);
                        if (filteredData != null) provider.filterCourses(filteredData);
                      }
                    },
                    icon: Row(
                      children: [
                        Text(provider.isFiltered ? 'Quitar filtro' : 'Buscar'),
                        const SizedBox(width: 5),
                        Icon(provider.isFiltered ? Icons.close : Icons.search),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CourseService.shared.categories.length,
                  itemBuilder: (context, index) {
                    final category = CourseService.shared.categories[index];
                    return CourseFilter(
                      label: category.label,
                      iconAsset: category.iconAsset,
                      isActive: provider.selectedIndex == index,
                      onTap: () async {
                        provider.selectCategory(index);
                        await provider.loadCourses(category: category);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              provider.isLoading
                  ? Container(
                      margin: EdgeInsets.only(top: Get.height * 0.15),
                      child: LoadingWidget(),
                    )
                  : provider.courses.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: Get.height * 0.15),
                      child: NoExistData(text: 'No fué posible obtener información'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.currentMax + 1,
                      itemBuilder: (context, index) {
                        if (index == provider.currentMax) {
                          return provider.isFetching
                              ? Center(child: CircularProgressIndicator.adaptive())
                              : const SizedBox.shrink();
                        }
                        final course = provider.courses[index];
                        return CourseCard(
                          category: provider.getCategoryBySubject(course.subjects ?? []),
                          course: course,
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
