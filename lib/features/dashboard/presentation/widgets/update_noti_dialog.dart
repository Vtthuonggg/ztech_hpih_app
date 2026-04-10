import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ztech_hpih_app/core/theme/app_theme.dart';

class UpdateNotiDialog extends StatelessWidget {
  const UpdateNotiDialog({super.key, this.onClose});

  final Future<void> Function()? onClose;

  static Future<void> openStore() async {
    final uri = Platform.isIOS
        ? Uri.parse('https://apps.apple.com/vn/app/id6467622531')
        : Uri.parse(
            'https://play.google.com/store/apps/details?id=com.ztech.hpih',
          );

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F4F8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.health_and_safety_rounded,
                    color: AppTheme.primaryColor,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Đã có phiên bản mới',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Vui lòng cập nhật ứng dụng để sử dụng các tính năng mới nhất và cải thiện trải nghiệm.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await openStore();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Cập nhật ngay'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () async {
                  if (onClose != null) {
                    await onClose!();
                    return;
                  }
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close_rounded, size: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
