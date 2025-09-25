import 'package:finny_test_dev/pages/favorites_page/favorites_courses.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavoritesBody extends StatefulWidget {
  const FavoritesBody({super.key});

  @override
  State<FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<FavoritesBody> {
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
            FavoritesCourses(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}
