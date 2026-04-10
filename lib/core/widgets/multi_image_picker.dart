import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ztech_hpih_app/core/theme/app_theme.dart';

/// Widget chọn/chụp nhiều ảnh, tối đa [maxCount] ảnh.
/// Hiển thị dạng Wrap grid với ô "Thêm ảnh" ở cuối.
class MultiImagePicker extends StatefulWidget {
  const MultiImagePicker({
    super.key,
    this.maxCount = 5,
    this.initialImages = const [],
    this.onChanged,
  });

  final int maxCount;
  final List<XFile> initialImages;

  /// Gọi lại mỗi khi danh sách ảnh thay đổi.
  final void Function(List<XFile> images)? onChanged;

  @override
  State<MultiImagePicker> createState() => _MultiImagePickerState();
}

class _MultiImagePickerState extends State<MultiImagePicker> {
  late final List<XFile> _images;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _images = List.of(widget.initialImages);
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

  void _notify() => widget.onChanged?.call(List.unmodifiable(_images));

  bool get _canAdd => _images.length < widget.maxCount;

  Future<void> _showSourceSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),
              _ActionTile(
                icon: IconsaxPlusLinear.camera,
                title: 'Chụp ảnh',
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickOne(ImageSource.camera);
                },
              ),
              _ActionTile(
                icon: IconsaxPlusLinear.gallery,
                title: 'Chọn từ thư viện',
                onTap: () async {
                  Navigator.of(context).pop();
                  await _pickMultiple();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickOne(ImageSource source) async {
    try {
      final file = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
      );
      if (!mounted || file == null) return;
      setState(() => _images.add(file));
      _notify();
    } catch (e, st) {
      log('MultiImagePicker._pickOne error: $e', stackTrace: st);
    }
  }

  Future<void> _pickMultiple() async {
    try {
      final remaining = widget.maxCount - _images.length;
      if (remaining <= 0) return;
      final files = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1024,
        limit: remaining,
      );
      if (!mounted || files.isEmpty) return;
      setState(() => _images.addAll(files.take(remaining)));
      _notify();
    } catch (e, st) {
      log('MultiImagePicker._pickMultiple error: $e', stackTrace: st);
    }
  }

  void _remove(int index) {
    setState(() => _images.removeAt(index));
    _notify();
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ...List.generate(
          _images.length,
          (i) => _ImageTile(
            file: File(_images[i].path),
            onRemove: () => _remove(i),
          ),
        ),
        if (_canAdd) _AddTile(onTap: _showSourceSheet),
      ],
    );
  }
}

// ── Image Tile ─────────────────────────────────────────────────────────────────

class _ImageTile extends StatelessWidget {
  const _ImageTile({required this.file, required this.onRemove});

  final File file;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 88,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(file, width: 88, height: 88, fit: BoxFit.cover),
          ),
          Positioned(
            top: -6,
            right: -6,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Add Tile ──────────────────────────────────────────────────────────────────

class _AddTile extends StatelessWidget {
  const _AddTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.4),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconsaxPlusLinear.camera,
              color: AppTheme.primaryColor,
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              'Thêm ảnh',
              style: TextStyle(
                fontSize: 11,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Action Tile (bottom sheet) ────────────────────────────────────────────────

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title),
      contentPadding: EdgeInsets.zero,
    );
  }
}
