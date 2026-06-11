import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Pressable extends HookWidget {
  const Pressable({
    super.key,
    required this.onTap,
    required this.child,
    this.pressedScale = 0.96,
  });

  final VoidCallback onTap;
  final Widget child;
  final double pressedScale;

  @override
  Widget build(BuildContext context) {
    final pressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => pressed.value = true,
      onTapUp: (_) => pressed.value = false,
      onTapCancel: () => pressed.value = false,
      onTap: onTap,
      child: AnimatedScale(
        scale: pressed.value ? pressedScale : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: child,
      ),
    );
  }
}
