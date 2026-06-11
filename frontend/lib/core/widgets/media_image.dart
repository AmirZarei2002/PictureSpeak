import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:frontend/core/api/api_client.dart';

class MediaImage extends StatelessWidget {
  const MediaImage({
    super.key,
    required this.path,
    required this.fallbackColor,
    this.fallbackLabel,
    this.fit = BoxFit.cover,
  });

  final String path;
  final Color fallbackColor;
  final String? fallbackLabel;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: mediaUrl(path),
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 250),
      placeholder: (context, url) =>
          Container(color: fallbackColor.withValues(alpha: 0.18)),
      errorWidget: (context, url, error) =>
          _Fallback(color: fallbackColor, label: fallbackLabel),
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.color, this.label});

  final Color color;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final hasLabel = label != null && label!.trim().isNotEmpty;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color, Color.lerp(color, Colors.black, 0.14)!],
        ),
      ),
      child: Center(
        child: hasLabel
            ? Text(
                label!.trim()[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.image_rounded, size: 56, color: Colors.white70),
      ),
    );
  }
}
