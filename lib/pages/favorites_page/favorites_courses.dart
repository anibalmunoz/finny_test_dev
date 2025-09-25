import 'package:finny_test_dev/providers/favorites_provider.dart';
import 'package:finny_test_dev/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FavoritesCourses extends StatelessWidget {
  final ScrollController scrollController;

  const FavoritesCourses({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = FavoritesProvider();
        provider.loadFavorites();

        scrollController.addListener(() {
          if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
            provider.loadMore();
          }
        });

        return provider;
      },
      child: Consumer<FavoritesProvider>(
        builder: (context, provider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabel(label: 'Favoritos', icon: Icons.star_outline),
              const SizedBox(height: 10),
              provider.isLoading
                  ? Container(
                      margin: EdgeInsets.only(top: Get.height * 0.15),
                      child: LoadingWidget(),
                    )
                  : provider.favorites.isEmpty
                  ? Center(child: Text('No se encontraron favoritos'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.currentMax + 1,
                      itemBuilder: (context, index) {
                        if (index == provider.currentMax) {
                          return provider.isFetching
                              ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(child: CircularProgressIndicator.adaptive()),
                                )
                              : const SizedBox.shrink();
                        }
                        final course = provider.favorites[index];
                        return CourseCard(
                          category: provider.getCategoryBySubject(course.subjects ?? []),
                          course: course,
                          onReturn: () => provider.refreshFavorites(),
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
