import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/theme/app_theme.dart';

class GeneralHealthPage extends StatefulWidget {
  static const path = '/general-health';

  const GeneralHealthPage({super.key});

  @override
  State<GeneralHealthPage> createState() => _GeneralHealthPageState();
}

class _GeneralHealthPageState extends State<GeneralHealthPage> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  bool _isBloodTypeUnknown = true;
  String? _selectedBloodType;
  bool _submitting = false;

  static const List<String> _bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  void initState() {
    super.initState();
    _heightController.addListener(_rebuild);
    _weightController.addListener(_rebuild);
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool get _canSubmit {
    return !_submitting &&
        (_isBloodTypeUnknown || _selectedBloodType != null) &&
        _heightController.text.trim().isNotEmpty &&
        _weightController.text.trim().isNotEmpty;
  }

  void _rebuild() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: Text(
          l10n.profile_general_health_title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OverviewCard(
                  heightText: _heightController.text.trim().isEmpty
                      ? '--'
                      : '${_heightController.text.trim()} ${l10n.profile_unit_cm}',
                  weightText: _weightController.text.trim().isEmpty
                      ? '--'
                      : '${_weightController.text.trim()} ${l10n.profile_unit_kg}',
                  bloodTypeText: _isBloodTypeUnknown
                      ? l10n.profile_blood_type_unknown
                      : (_selectedBloodType ?? l10n.profile_blood_type_unknown),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(
                        icon: IconsaxPlusLinear.activity,
                        title: l10n.profile_label_blood_type,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F7FC),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                IconsaxPlusLinear.drop,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.profile_blood_type_unknown,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    l10n.profile_blood_type_subtitle,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF667085),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: _isBloodTypeUnknown,
                              activeThumbColor: AppTheme.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  _isBloodTypeUnknown = value;
                                  if (value) {
                                    _selectedBloodType = null;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      IgnorePointer(
                        ignoring: _isBloodTypeUnknown,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 180),
                          opacity: _isBloodTypeUnknown ? 0.42 : 1,
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: _bloodTypes.map((type) {
                              final isSelected = _selectedBloodType == type;
                              return ChoiceChip(
                                label: SizedBox(
                                  width: 52,
                                  child: Center(
                                    child: Text(
                                      type,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: isSelected
                                            ? AppTheme.primaryColor
                                            : const Color(0xFF344054),
                                      ),
                                    ),
                                  ),
                                ),
                                selected: isSelected,
                                showCheckmark: false,
                                side: BorderSide(
                                  color: isSelected
                                      ? AppTheme.primaryColor
                                      : const Color(0xFFE4E7EC),
                                ),
                                backgroundColor: Colors.white,
                                selectedColor: AppTheme.primaryColor.withValues(
                                  alpha: 0.1,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 12,
                                ),
                                onSelected: (_) {
                                  setState(() => _selectedBloodType = type);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(
                        icon: IconsaxPlusLinear.rulerpen,
                        title: l10n.profile_height_weight_title,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _heightController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: InputDecoration(
                                hintText: l10n.profile_label_height,
                                prefixIcon: Icon(IconsaxPlusLinear.ruler),
                                suffixText: l10n.profile_unit_cm,
                              ),
                              validator: (value) {
                                final raw = (value ?? '').trim();
                                if (raw.isEmpty) return l10n.profile_required;
                                final parsed = _parseDouble(raw);
                                if (parsed == null || parsed <= 0) {
                                  return l10n.profile_invalid_value;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _weightController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              decoration: InputDecoration(
                                hintText: l10n.profile_label_weight,
                                prefixIcon: Icon(IconsaxPlusLinear.weight),
                                suffixText: l10n.profile_unit_kg,
                              ),
                              validator: (value) {
                                final raw = (value ?? '').trim();
                                if (raw.isEmpty) return l10n.profile_required;
                                final parsed = _parseDouble(raw);
                                if (parsed == null || parsed <= 0) {
                                  return l10n.profile_invalid_value;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              IconsaxPlusLinear.info_circle,
                              color: AppTheme.primaryColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                l10n.profile_decimal_input_hint,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF475467),
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _canSubmit ? _submit : null,
              child: _submitting
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.profile_finish_button),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _submitting = true);

    try {
      final payload = <String, dynamic>{
        'blood_type': _isBloodTypeUnknown ? null : _selectedBloodType,
        'blood_type_unknown': _isBloodTypeUnknown,
        'height_cm': _parseDouble(_heightController.text),
        'weight_kg': _parseDouble(_weightController.text),
      };

      log('GeneralHealth payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 800));

      if (!mounted) return;
      final l10n = context.l10n;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.profile_general_health_saved_snackbar)),
      );
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  static double? _parseDouble(String raw) {
    final value = raw.trim().replaceAll(',', '.');
    if (value.isEmpty) return null;
    return double.tryParse(value);
  }
}

class _OverviewCard extends StatelessWidget {
  const _OverviewCard({
    required this.heightText,
    required this.weightText,
    required this.bloodTypeText,
  });

  final String heightText;
  final String weightText;
  final String bloodTypeText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryColor, Color(0xFF3A6BBF)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(IconsaxPlusLinear.heart_circle, color: Colors.white),
              SizedBox(width: 8),
              Text(
                l10n.profile_overview_title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _OverviewItem(
                  label: l10n.profile_label_blood_type,
                  value: bloodTypeText,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _OverviewItem(
                  label: l10n.profile_label_height,
                  value: heightText,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _OverviewItem(
                  label: l10n.profile_label_weight,
                  value: weightText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OverviewItem extends StatelessWidget {
  const _OverviewItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: AppTheme.primaryColor),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xFF101828),
          ),
        ),
      ],
    );
  }
}
