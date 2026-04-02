import 'package:flutter/material.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';

import '../theme/app_theme.dart';

class SelectOptionBottomSheetOption {
  const SelectOptionBottomSheetOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.subtitle,
    this.iconColor = AppTheme.primaryColor,
    Color? iconBackground,
  }) : iconBackground =
           iconBackground ?? const Color(0x1F234F9B);

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final Future<void> Function(BuildContext context) onTap;
}

class SelectOptionBottomSheet extends StatelessWidget {
  const SelectOptionBottomSheet({
    super.key,
    required this.title,
    required this.options,
    this.closeText,
  });

  final String title;
  final List<SelectOptionBottomSheetOption> options;
  final String? closeText;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<SelectOptionBottomSheetOption> options,
    String? closeText,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.22),
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) {
        return SelectOptionBottomSheet(
          title: title,
          options: options,
          closeText: closeText,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedCloseText = closeText ?? context.l10n.common_close;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
      ),
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
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 16),
          for (final option in options)
            _SelectOptionTile(option: option),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).maybePop(),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                foregroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                resolvedCloseText,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectOptionTile extends StatelessWidget {
  const _SelectOptionTile({required this.option});

  final SelectOptionBottomSheetOption option;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ListTile(
        onTap: () async {
          Navigator.of(context).pop();
          await option.onTap(context);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: option.iconBackground,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(option.icon, color: option.iconColor),
        ),
        title: Text(
          option.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.grey[900],
          ),
        ),
        subtitle: option.subtitle == null
            ? null
            : Text(
                option.subtitle!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[500]),
      ),
    );
  }
}
