import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/services/course_service.dart';
import 'package:finny_test_dev/widgets/common_dialogs.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesWidget extends StatefulWidget {
  final ScrollController scrollController;
  const CoursesWidget({super.key, required this.scrollController});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  List<Module> _originalData = [];
  bool _isFiltered = false;
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

  Future _future = CourseService.shared.fetchData();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomLabel(label: 'Cursos', icon: Icons.error_outline),
            IconButton(
              onPressed: () async {
                if (_isFiltered) {
                  setState(() {
                    _data = List.from(_originalData);
                    _isFiltered = false;
                  });
                } else {
                  final filterData = await showSearchCoursesDialog(context: context, courses: _originalData);
                  if (filterData != null && filterData.isNotEmpty) {
                    setState(() {
                      _data = filterData;
                      _isFiltered = true;
                      if (_data.length < 11) _currentMax = _data.length < _itemsPerPage ? _data.length : _itemsPerPage;
                    });
                  } else if (filterData != null && filterData.isEmpty) {
                    CommonDialogs.shared.showNotifyDialog(
                      tittle: 'No se encontraron cursos',
                      contentString: 'No fué posible obtener coincidencias',
                    );
                  }
                }
              },
              icon: Row(
                children: [
                  Text(_isFiltered ? 'Quitar filtro' : 'Buscar'),
                  const SizedBox(width: 5),
                  Icon(_isFiltered ? Icons.close : Icons.search),
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
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CourseFilter(
                label: categories[index].label,
                iconAsset: categories[index].iconAsset,
                isActive: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    _currentMax = _itemsPerPage;
                    _future = CourseService.shared.fetchData(category: categories[index]);
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
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
                child: NoExistData(text: 'Ocurrió un error al obtener los cursos'),
              );
            }
            if (!_isFiltered) _originalData = snapshot.data!;
            if (!_isFiltered) _data = snapshot.data!;
            if (_data.length < 11) _currentMax = _data.length < _itemsPerPage ? _data.length : _itemsPerPage;
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
                return CourseCard(category: _getCategoryBySubject(course.subjects ?? []), course: course);
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
