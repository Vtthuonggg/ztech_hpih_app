import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app/core/providers/locale_provider.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import 'package:healthcare_app/core/theme/app_theme.dart';

class LanguagePage extends ConsumerWidget {
  static const path = '/settings/language';
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final notifier = ref.read(localeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.account_language),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            const SizedBox(height: 8),
            _LanguageOption(
              label: 'Tiếng Việt',
              localeValue: const Locale('vi', 'VN'),
              groupValue: locale,
              onSelected: (v) => notifier.state = v,
            ),
            const SizedBox(height: 12),
            _LanguageOption(
              label: 'English',
              localeValue: const Locale('en', 'US'),
              groupValue: locale,
              onSelected: (v) => notifier.state = v,
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.app_title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.localeValue,
    required this.groupValue,
    required this.onSelected,
  });

  final String label;
  final Locale localeValue;
  final Locale? groupValue;
  final void Function(Locale) onSelected;

  @override
  Widget build(BuildContext context) {
    final selected = groupValue?.toString() == localeValue.toString();
    return Material(
      color: Colors.white,
      elevation: selected ? 6 : 0,
      shadowColor: Colors.black.withOpacity(0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected ? AppTheme.primaryColor : const Color(0xFFE6E9EE),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onSelected(localeValue),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              if (selected)
                Icon(Icons.check_circle, color: AppTheme.primaryColor)
              else
                const Icon(Icons.chevron_right, color: Color(0xFF98A2B3)),
            ],
          ),
        ),
      ),
    );
  }
}
