import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final void Function()? onTap;
  const FavoriteButton({super.key, this.onTap});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        widget.onTap?.call();
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? const Color(0xFFAE55EE) : Colors.black26,
            ),
            const SizedBox(width: 5),
            Text(
              isFavorite ? 'Favorito' : 'Agregar',
              style: TextStyle(color: isFavorite ? const Color(0xFFAE55EE) : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
