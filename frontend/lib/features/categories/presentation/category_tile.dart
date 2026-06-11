import 'package:flutter/material.dart';

import 'package:frontend/core/theme/hex_color.dart';
import 'package:frontend/core/widgets/media_image.dart';
import 'package:frontend/core/widgets/pressable.dart';
import 'package:frontend/features/categories/data/category.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category, required this.onTap});

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final accent = hexToColor(category.colorHex);
    final textTheme = Theme.of(context).textTheme;

    return Pressable(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: MediaImage(
                path: category.coverImagePath,
                fallbackColor: accent,
                fallbackLabel: category.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(
                        Icons.collections_bookmark_outlined,
                        size: 14,
                        color: textTheme.bodySmall?.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        context.l10n.wordsCount(category.itemCount),
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
