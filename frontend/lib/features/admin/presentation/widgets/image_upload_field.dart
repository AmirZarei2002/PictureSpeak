import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/widgets/media_image.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class ImageUploadField extends ConsumerStatefulWidget {
  const ImageUploadField({
    super.key,
    required this.label,
    required this.kind,
    required this.path,
    required this.onPathChanged,
    this.helperText,
    this.required = false,
  });

  final String label;

  final AdminUploadKind kind;

  final String path;

  final ValueChanged<String> onPathChanged;

  final String? helperText;

  final bool required;

  @override
  ConsumerState<ImageUploadField> createState() => _ImageUploadFieldState();
}

class _ImageUploadFieldState extends ConsumerState<ImageUploadField> {
  bool _uploading = false;

  Future<void> _pick() async {
    if (_uploading) return;
    final l10n = context.l10n;

    final result = await FilePicker.pickFiles(
      type: FileType.image,
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
        kind: widget.kind,
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
    final showRequiredError = widget.required && !hasPath && !_uploading;

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
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: showRequiredError
                  ? colors.error
                  : colors.outlineVariant,
              width: 1.2,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (hasPath)
                      _Preview(path: widget.path)
                    else
                      _EmptyPreview(error: showRequiredError),
                    if (_uploading)
                      Container(
                        color: Colors.black54,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        hasPath ? widget.path : context.l10n.noImageChosen,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: hasPath
                                  ? colors.onSurfaceVariant
                                  : colors.onSurfaceVariant.withValues(alpha: 0.7),
                              fontStyle: hasPath
                                  ? FontStyle.normal
                                  : FontStyle.italic,
                            ),
                      ),
                    ),
                    if (hasPath)
                      IconButton(
                        tooltip: context.l10n.clear,
                        onPressed: _uploading
                            ? null
                            : () => widget.onPathChanged(''),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    FilledButton.tonalIcon(
                      onPressed: _uploading ? null : _pick,
                      icon: const Icon(Icons.upload_rounded, size: 18),
                      label: Text(
                        hasPath ? context.l10n.replace : context.l10n.chooseImage,
                      ),
                    ),
                  ],
                ),
              ),
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
        if (showRequiredError)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 6),
            child: Text(
              context.l10n.required,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.error,
                  ),
            ),
          ),
      ],
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final isLocal = path.startsWith('/') ||
        RegExp(r'^[A-Za-z]:[/\\]').hasMatch(path);
    if (isLocal) {
      return Image.file(File(path), fit: BoxFit.cover);
    }
    return MediaImage(
      path: path,
      fallbackColor: Theme.of(context).colorScheme.primary,
    );
  }
}

class _EmptyPreview extends StatelessWidget {
  const _EmptyPreview({required this.error});

  final bool error;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      color: error
          ? colors.errorContainer.withValues(alpha: 0.35)
          : colors.surfaceContainerHigh,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 48,
            color: colors.onSurfaceVariant.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.tapToChooseImage,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
