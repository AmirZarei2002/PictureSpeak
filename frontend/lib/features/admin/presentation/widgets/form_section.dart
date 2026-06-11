import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.title,
    this.caption,
    required this.children,
  });

  final String title;
  final String? caption;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 4),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
          ),
        ),
        if (caption != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 12),
            child: Text(
              caption!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          )
        else
          const SizedBox(height: 8),
        ...children,
      ],
    );
  }
}
