import 'package:finny_test_dev/pages/construction_page/construction_body.dart';
import 'package:finny_test_dev/pages/curses_page/curses_body.dart';
import 'package:finny_test_dev/pages/favorites_page/favorites_body.dart';
import 'package:finny_test_dev/providers/navigator_provider.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigatorProvider>(context);

    return Scaffold(
      appBar: getCustomAppBar(context),
      body: simpleNavigation(provider.selectedIndex),
      bottomNavigationBar: CustomNavigator(),
    );
  }

  Widget simpleNavigation(int index) {
    switch (index) {
      case 0:
        return ConstructionBody();
      case 1:
        return ConstructionBody();
      case 3:
        return FavoritesBody();
      case 2:
      default:
        return CoursesBody();
    }
  }
}
