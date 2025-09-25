import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/repositories/favorites_repository.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesCourses extends StatefulWidget {
  final ScrollController scrollController;
  const FavoritesCourses({super.key, required this.scrollController});

  @override
  State<FavoritesCourses> createState() => _FavoritesCoursesState();
}

class _FavoritesCoursesState extends State<FavoritesCourses> {
  int selectedIndex = 0;
  final int _itemsPerPage = 10;
  int _currentMax = 10;
  ScrollController _scrollController = ScrollController();

  final List<CategoryModel> categories = [
    CategoryModel(label: 'Todos los cursos'),
    CategoryModel(label: 'Inversiones', iconAsset: 'assets/icons/money-1.png', subject: 'supply-chain-management'),
    CategoryModel(
      label: 'Finanzas personales',
      iconAsset: 'assets/icons/wallet-1-dollar.png',
      subject: 'finance-accounting',
    ),
    CategoryModel(label: 'Planificación', iconAsset: 'assets/icons/education.png', subject: 'productivity'),
    CategoryModel(label: 'Deuda', iconAsset: 'assets/icons/credit.png', subject: 'classification-analysis'),
  ];

  Future _future = FavoritesRepository.shared.getAll();
  List<Module> _data = [];

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  Future<void> _loadMoreData() async {
    if (_currentMax < _data.length) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() => _currentMax = (_currentMax + _itemsPerPage).clamp(0, _data.length));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(label: 'Favoritos', icon: Icons.star_outline),
        const SizedBox(height: 10),
        FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                margin: EdgeInsets.only(top: Get.height * 0.15),
                child: LoadingWidget(),
              );
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Container(
                margin: EdgeInsets.only(top: Get.height * 0.15),
                child: NoExistData(text: 'No se encontraron favoritos'),
              );
            }
            _data = snapshot.data!;
            if (_data.length < 10) _currentMax = _data.length < _itemsPerPage ? _data.length : _itemsPerPage;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _currentMax + 1,
              itemBuilder: (context, index) {
                if (index == _currentMax) {
                  return _currentMax < _data.length
                      ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator.adaptive()),
                        )
                      : const SizedBox.shrink();
                }
                final course = _data[index];
                return CourseCard(
                  category: _getCategoryBySubject(course.subjects ?? []),
                  course: course,
                  onReturn: () {
                    setState(() {
                      _future = FavoritesRepository.shared.getAll();
                    });
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }

  CategoryModel _getCategoryBySubject(List<String> subjects) {
    for (var category in categories) {
      if (category.subject != null && subjects.contains(category.subject)) {
        return category;
      }
    }
    return categories[2];
  }
}
