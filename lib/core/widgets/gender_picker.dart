import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum Gender {
  male('Nam', 'male', Icons.male_rounded),
  female('Nữ', 'female', Icons.female_rounded);

  const Gender(this.label, this.apiValue, this.icon);

  final String label;
  final String apiValue;
  final IconData icon;
}

class GenderPicker extends StatelessWidget {
  const GenderPicker({super.key, required this.value, required this.onChanged});

  final Gender? value;
  final ValueChanged<Gender> onChanged;

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
                      gender.label,
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
