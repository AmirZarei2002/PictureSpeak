import 'package:flutter/material.dart';

import 'package:frontend/core/widgets/media_image.dart';
import 'package:frontend/core/widgets/pressable.dart';
import 'package:frontend/features/categories/data/learning_item.dart';
import 'package:frontend/features/favorites/presentation/favorite_button.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.accent,
    required this.onTap,
  });

  final LearningItem item;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Pressable(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'item-image-${item.id}',
                    child: MediaImage(
                      path: item.thumbnailPath ?? item.imagePath,
                      fallbackColor: accent,
                      fallbackLabel: item.name,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: FavoriteBadge(itemId: item.id),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
