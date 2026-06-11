import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/audio/audio_service.dart';
import 'package:frontend/core/widgets/media_image.dart';
import 'package:frontend/features/categories/data/learning_item.dart';
import 'package:frontend/features/favorites/presentation/favorite_button.dart';
import 'package:frontend/features/progress/application/progress_providers.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class CardDeckArgs {
  const CardDeckArgs({required this.items, this.initialIndex = 0, this.title});

  final List<LearningItem> items;
  final int initialIndex;
  final String? title;
}

class LearningCardScreen extends HookConsumerWidget {
  const LearningCardScreen({super.key, required this.args});

  final CardDeckArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = args.items;
    final pageController = usePageController(initialPage: args.initialIndex);
    final currentIndex = useState(args.initialIndex);

    final recorder = ref.read(progressRecorderProvider.notifier);
    final audioService = ref.read(audioServiceProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        recorder.recordView(items[args.initialIndex].id);
      });
      return audioService.stop;
    }, const []);

    void goTo(int index) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(args.title ?? context.l10n.learnTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: items.length,
                onPageChanged: (i) {
                  currentIndex.value = i;
                  recorder.recordView(items[i].id);
                },
                itemBuilder: (context, index) => _Card(item: items[index]),
              ),
            ),
            _ControlBar(
              index: currentIndex.value,
              total: items.length,
              onPrev: currentIndex.value > 0
                  ? () => goTo(currentIndex.value - 1)
                  : null,
              onNext: currentIndex.value < items.length - 1
                  ? () => goTo(currentIndex.value + 1)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends ConsumerWidget {
  const _Card({required this.item});

  final LearningItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isPlaying = ref.watch(audioControllerProvider) == item.id;

    void playWord() {
      ref.read(audioControllerProvider.notifier).play(item);
      ref.read(progressRecorderProvider.notifier).recordListen(item.id);
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: playWord,
              child: Hero(
                tag: 'item-image-${item.id}',
                child: AnimatedScale(
                  scale: isPlaying ? 1.03 : 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: MediaImage(
                      path: item.imagePath,
                      fallbackColor: colors.primary,
                      fallbackLabel: item.name,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w800),
              )
              .animate(key: ValueKey(item.id))
              .fadeIn(duration: 350.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FavoriteButton(itemId: item.id, size: 36),
              _SpeakerButton(isPlaying: isPlaying, onTap: playWord),
              const SizedBox(width: 48), 
            ],
          ),
        ],
      ),
    );
  }
}

class _SpeakerButton extends StatelessWidget {
  const _SpeakerButton({required this.isPlaying, required this.onTap});

  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Widget button = Material(
      color: colors.primary,
      shape: const CircleBorder(),
      elevation: 3,
      shadowColor: colors.primary,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Icon(
            Icons.volume_up_rounded,
            size: 40,
            color: colors.onPrimary,
          ),
        ),
      ),
    );

    if (isPlaying) {
      button = button
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(end: 1.12, duration: 500.ms, curve: Curves.easeInOut);
    }

    return Semantics(button: true, label: context.l10n.playWord, child: button);
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({
    required this.index,
    required this.total,
    required this.onPrev,
    required this.onNext,
  });

  final int index;
  final int total;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final style = IconButton.styleFrom(minimumSize: const Size(64, 64));

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filledTonal(
            onPressed: onPrev,
            iconSize: 36,
            style: style,
            icon: const Icon(Icons.chevron_left),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              context.l10n.cardPosition(index + 1, total),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          IconButton.filledTonal(
            onPressed: onNext,
            iconSize: 36,
            style: style,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
