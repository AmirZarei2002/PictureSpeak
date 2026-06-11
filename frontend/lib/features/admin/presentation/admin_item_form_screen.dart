import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_items_controller.dart';
import 'package:frontend/features/admin/data/admin_item.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/admin/presentation/widgets/audio_upload_field.dart';
import 'package:frontend/features/admin/presentation/widgets/form_section.dart';
import 'package:frontend/features/admin/presentation/widgets/image_upload_field.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminItemFormScreen extends ConsumerStatefulWidget {
  const AdminItemFormScreen({super.key, this.categoryId, this.existing})
      : assert(categoryId != null || existing != null,
            'categoryId or existing is required');

  final String? categoryId;
  final AdminItem? existing;

  @override
  ConsumerState<AdminItemFormScreen> createState() =>
      _AdminItemFormScreenState();
}

const List<int> _sortOrderOptions = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

class _AdminItemFormScreenState extends ConsumerState<AdminItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _slug;
  late String _imagePath;
  late String _thumbnailPath;
  late String _audioPath;
  late int _sortOrder;
  late bool _isActive;
  bool _submitting = false;

  bool get _isEdit => widget.existing != null;
  String get _categoryId =>
      widget.existing?.categoryId ?? widget.categoryId!;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _name = TextEditingController(text: e?.name ?? '');
    _slug = TextEditingController(text: e?.slug ?? '');
    _imagePath = e?.imagePath ?? '';
    _thumbnailPath = e?.thumbnailPath ?? '';
    _audioPath = e?.audioPath ?? '';
    _sortOrder = _nearestBucket(e?.sortOrder ?? 0);
    _isActive = e?.isActive ?? true;
  }

  int _nearestBucket(int value) {
    return _sortOrderOptions.reduce((a, b) =>
        (value - a).abs() <= (value - b).abs() ? a : b);
  }

  @override
  void dispose() {
    _name.dispose();
    _slug.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? l10n.editItem : l10n.newItemTitle)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            children: [
              FormSection(
                title: l10n.sectionBasics,
                caption: l10n.itemBasicsCaption,
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: l10n.name,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l10n.required : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _slug,
                    decoration: InputDecoration(
                      labelText: l10n.slug,
                      helperText: l10n.slugHelperUnique,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return l10n.required;
                      if (!RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$').hasMatch(v)) {
                        return l10n.slugInvalid;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormSection(
                title: l10n.sectionMedia,
                caption: l10n.itemMediaCaption,
                children: [
                  ImageUploadField(
                    label: l10n.imageLabel,
                    kind: AdminUploadKind.image,
                    path: _imagePath,
                    required: true,
                    helperText: l10n.imageUploadHelper,
                    onPathChanged: (p) => setState(() => _imagePath = p),
                  ),
                  const SizedBox(height: 24),
                  ImageUploadField(
                    label: l10n.thumbnailLabel,
                    kind: AdminUploadKind.thumbnail,
                    path: _thumbnailPath,
                    helperText: l10n.thumbnailUploadHelper,
                    onPathChanged: (p) => setState(() => _thumbnailPath = p),
                  ),
                  const SizedBox(height: 24),
                  AudioUploadField(
                    label: l10n.audioLabel,
                    path: _audioPath,
                    helperText: l10n.audioUploadHelper,
                    onPathChanged: (p) => setState(() => _audioPath = p),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormSection(
                title: l10n.sectionDisplay,
                caption: l10n.itemDisplayCaption,
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: _sortOrder,
                    decoration: InputDecoration(
                      labelText: l10n.sortOrder,
                      helperText: l10n.sortOrderItemHelper,
                      border: const OutlineInputBorder(),
                    ),
                    items: [
                      for (final v in _sortOrderOptions)
                        DropdownMenuItem(
                          value: v,
                          child: Text(context.localizedNumber(v)),
                        ),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => _sortOrder = v);
                    },
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.active),
                    subtitle: Text(l10n.itemActiveSubtitle),
                    value: _isActive,
                    onChanged: (v) => setState(() => _isActive = v),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                onPressed: _submitting ? null : _submit,
                icon: _submitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: Text(_isEdit ? l10n.saveChanges : l10n.createItem),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = context.l10n;

    final image = _imagePath.trim();
    if (image.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.uploadImagePrompt)),
      );
      return;
    }
    setState(() => _submitting = true);

    final actions = ref.read(adminItemActionsProvider);
    final thumb = _thumbnailPath.trim();
    final audio = _audioPath.trim();

    try {
      if (_isEdit) {
        await actions.update(
          widget.existing!,
          name: _name.text.trim(),
          slug: _slug.text.trim(),
          imagePath: image,
          thumbnailPath: thumb,
          audioPath: audio,
          sortOrder: _sortOrder,
          isActive: _isActive,
        );
      } else {
        await actions.create(
          _categoryId,
          name: _name.text.trim(),
          slug: _slug.text.trim(),
          imagePath: image,
          thumbnailPath: thumb.isEmpty ? null : thumb,
          audioPath: audio.isEmpty ? null : audio,
          sortOrder: _sortOrder,
          isActive: _isActive,
        );
      }
      if (mounted) context.pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.saveFailed(e))),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}
