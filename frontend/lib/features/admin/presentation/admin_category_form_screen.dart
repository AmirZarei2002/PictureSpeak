import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_categories_controller.dart';
import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/admin/presentation/widgets/form_section.dart';
import 'package:frontend/features/admin/presentation/widgets/image_upload_field.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminCategoryFormScreen extends ConsumerStatefulWidget {
  const AdminCategoryFormScreen({super.key, this.existing});

  final AdminCategory? existing;

  @override
  ConsumerState<AdminCategoryFormScreen> createState() =>
      _AdminCategoryFormScreenState();
}

const List<int> _sortOrderOptions = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

class _AdminCategoryFormScreenState
    extends ConsumerState<AdminCategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _slug;
  late final TextEditingController _colorHex;
  late String _coverImagePath;
  late int _sortOrder;
  late bool _isActive;
  bool _submitting = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _name = TextEditingController(text: e?.name ?? '');
    _slug = TextEditingController(text: e?.slug ?? '');
    _coverImagePath = e?.coverImagePath ?? '';
    _colorHex = TextEditingController(text: e?.colorHex ?? '#7BAFD4');
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
    _colorHex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? l10n.editCategory : l10n.newCategory),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            children: [
              FormSection(
                title: l10n.sectionBasics,
                caption: l10n.categoryBasicsCaption,
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
                      helperText: l10n.slugHelper,
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
                title: l10n.sectionAppearance,
                caption: l10n.categoryAppearanceCaption,
                children: [
                  ImageUploadField(
                    label: l10n.coverImageLabel,
                    kind: AdminUploadKind.categoryCover,
                    path: _coverImagePath,
                    required: true,
                    helperText: l10n.coverImageUploadHelper,
                    onPathChanged: (p) => setState(() => _coverImagePath = p),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _colorHex,
                    decoration: InputDecoration(
                      labelText: l10n.colorHex,
                      helperText: l10n.colorHexHelper,
                      border: const OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return null;
                      if (!RegExp(r'^#?[0-9a-fA-F]{6}$').hasMatch(v.trim())) {
                        return l10n.colorHexInvalid;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormSection(
                title: l10n.sectionDisplay,
                caption: l10n.categoryDisplayCaption,
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: _sortOrder,
                    decoration: InputDecoration(
                      labelText: l10n.sortOrder,
                      helperText: l10n.sortOrderHelper,
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
                    subtitle: Text(l10n.categoryActiveSubtitle),
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
                label: Text(_isEdit ? l10n.saveChanges : l10n.createCategory),
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

    final cover = _coverImagePath.trim();
    if (cover.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.uploadCoverImagePrompt)),
      );
      return;
    }
    setState(() => _submitting = true);

    final actions = ref.read(adminCategoryActionsProvider);
    final colorRaw = _colorHex.text.trim();
    final color = colorRaw.isEmpty
        ? null
        : (colorRaw.startsWith('#') ? colorRaw : '#$colorRaw');

    try {
      if (_isEdit) {
        await actions.update(
          widget.existing!.id,
          name: _name.text.trim(),
          slug: _slug.text.trim(),
          coverImagePath: cover,
          colorHex: color,
          sortOrder: _sortOrder,
          isActive: _isActive,
        );
      } else {
        await actions.create(
          name: _name.text.trim(),
          slug: _slug.text.trim(),
          coverImagePath: cover,
          colorHex: color,
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
