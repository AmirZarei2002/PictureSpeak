import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AudioUploadField extends ConsumerStatefulWidget {
  const AudioUploadField({
    super.key,
    required this.label,
    required this.path,
    required this.onPathChanged,
    this.helperText,
  });

  final String label;
  final String path;
  final ValueChanged<String> onPathChanged;
  final String? helperText;

  @override
  ConsumerState<AudioUploadField> createState() => _AudioUploadFieldState();
}

class _AudioUploadFieldState extends ConsumerState<AudioUploadField> {
  bool _uploading = false;

  Future<void> _pick() async {
    if (_uploading) return;
    final l10n = context.l10n;

    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['mp3', 'm4a', 'aac', 'wav', 'ogg'],
      withData: false,
      allowMultiple: false,
    );
    if (result == null || result.files.isEmpty) return;
    final picked = result.files.single;
    final localPath = picked.path;
    if (localPath == null) {
      _snack(l10n.couldNotReadFile);
      return;
    }

    setState(() => _uploading = true);
    try {
      final repo = ref.read(adminRepositoryProvider);
      final stored = await repo.uploadFile(
        localFilePath: localPath,
        filename: picked.name,
        kind: AdminUploadKind.audio,
      );
      widget.onPathChanged(stored);
    } catch (e) {
      _snack(l10n.uploadFailed(e));
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  void _snack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final hasPath = widget.path.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.outlineVariant, width: 1.2),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: hasPath
                      ? colors.primaryContainer
                      : colors.surfaceContainerHigh,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  hasPath
                      ? Icons.music_note_rounded
                      : Icons.audiotrack_outlined,
                  color: hasPath
                      ? colors.onPrimaryContainer
                      : colors.onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasPath ? widget.path : context.l10n.noAudioChosen,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: hasPath
                            ? colors.onSurface
                            : colors.onSurfaceVariant.withValues(alpha: 0.7),
                        fontStyle:
                            hasPath ? FontStyle.normal : FontStyle.italic,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              if (_uploading)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              else ...[
                if (hasPath)
                  IconButton(
                    tooltip: context.l10n.clear,
                    onPressed: () => widget.onPathChanged(''),
                    icon: const Icon(Icons.close_rounded),
                  ),
                FilledButton.tonalIcon(
                  onPressed: _pick,
                  icon: const Icon(Icons.upload_rounded, size: 18),
                  label: Text(
                    hasPath ? context.l10n.replace : context.l10n.chooseAudio,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (widget.helperText != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 6),
            child: Text(
              widget.helperText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ),
      ],
    );
  }
}
