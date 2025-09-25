import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final double rating;
  final int reviews;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                      );
                    },
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: BoxBorder.all(color: Colors.black26),
                  ),
                  child: Row(
                    children: [Text(category, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300))],
                  ),
                ),
                const SizedBox(height: 6),
                Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('$rating', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Icon(Icons.star, color: Color(0xFFC78AF6), size: 16),
                    const SizedBox(width: 4),
                    Text('(${formatReviews(reviews)} reseñas)', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatReviews(int reviews) {
    if (reviews >= 1000000) {
      double value = reviews / 1000000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}M';
    } else if (reviews >= 1000) {
      double value = reviews / 1000;
      return '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}K';
    } else {
      return reviews.toString();
    }
  }
}
