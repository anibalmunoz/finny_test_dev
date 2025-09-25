import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/repositories/favorites_repository.dart';
import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class FavoriteButton extends StatefulWidget {
  final Module course;
  const FavoriteButton({super.key, required this.course});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? isFavorite;

  @override
  void initState() {
    super.initState();
    _loadFavorite();
  }

  Future<void> _loadFavorite() async {
    final exists = await FavoritesRepository.shared.exists(widget.course.uid ?? '');
    setState(() => isFavorite = exists);
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite == true) {
      await FavoritesRepository.shared.deleteByUid(widget.course.uid ?? '');
    } else {
      await FavoritesRepository.shared.saveAll([widget.course]);
    }
    setState(() => isFavorite = !isFavorite!);
  }

  @override
  Widget build(BuildContext context) {
    if (isFavorite == null) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }
    return InkWell(
      onTap: _toggleFavorite,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.isDarkMode ? Colors.white : Colors.black26),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isFavorite! ? Icons.star : Icons.star_border,
              color: isFavorite!
                  ? AppColors.shared.purple1
                  : context.isDarkMode
                  ? null
                  : Colors.black26,
            ),
            const SizedBox(width: 5),
            Text(
              isFavorite! ? 'Favorito' : 'Agregar favorito',
              style: TextStyle(
                color: isFavorite!
                    ? AppColors.shared.purple1
                    : context.isDarkMode
                    ? null
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
