import 'package:finny_test_dev/providers/navigator_provider.dart';
import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  final List<IconData> _icons = [Icons.home, Icons.pie_chart, Icons.school, Icons.star];

  final List<String> _labels = ["Inicio", "Presupuesto", "Academy", "Favoritos"];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigatorProvider>(context);

    return BottomNavigationBar(
      backgroundColor: context.isDarkMode ? Color(0xFF383838) : Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: provider.selectedIndex,
      onTap: (index) {
        setState(() => provider.selectedIndex = index);
      },
      selectedItemColor: AppColors.shared.purple1,
      unselectedItemColor: context.isDarkMode ? Colors.white : null,
      showUnselectedLabels: true,
      items: List.generate(_icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Stack(alignment: Alignment.bottomCenter, children: [Icon(_icons[index])]),
          label: _labels[index],
        );
      }),
    );
  }
}
