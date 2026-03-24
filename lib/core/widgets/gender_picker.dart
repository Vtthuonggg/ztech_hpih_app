import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';

enum Gender {
  male('male', Icons.male_rounded),
  female('female', Icons.female_rounded);

  const Gender(this.apiValue, this.icon);

  final String apiValue;
  final IconData icon;
}

typedef GenderLabelBuilder =
    String Function(BuildContext context, Gender gender);

class GenderPicker extends StatelessWidget {
  const GenderPicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.labelBuilder,
  });

  final Gender? value;
  final ValueChanged<Gender> onChanged;
  final GenderLabelBuilder? labelBuilder;

  String _defaultLabel(BuildContext context, Gender gender) {
    final l10n = context.l10n;
    switch (gender) {
      case Gender.male:
        return l10n.profile_gender_male;
      case Gender.female:
        return l10n.profile_gender_female;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values.map((gender) {
        final isSelected = gender == value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: gender == Gender.male ? 10 : 0),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onChanged(gender),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.primaryColor.withValues(alpha: 0.1)
                      : const Color(0xFFF4F6F8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryColor
                        : const Color(0xFFE4E7EC),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      gender.icon,
                      size: 18,
                      color: isSelected
                          ? AppTheme.primaryColor
                          : const Color(0xFF667085),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      (labelBuilder ?? _defaultLabel)(context, gender),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : const Color(0xFF344054),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
// ...existing code...