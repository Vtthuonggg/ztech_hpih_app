import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:ztech_hpih_app/core/theme/app_theme.dart';
import 'package:ztech_hpih_app/core/widgets/custom_date_picker.dart';
import 'package:ztech_hpih_app/core/widgets/gender_picker.dart';
import 'package:ztech_hpih_app/core/widgets/select_option_bottom_sheet.dart';

class MotherProfilePage extends ConsumerStatefulWidget {
  static const path = '/mother-profile';
  const MotherProfilePage({super.key});

  @override
  ConsumerState<MotherProfilePage> createState() => _MotherProfilePageState();
}

class _MotherProfilePageState extends ConsumerState<MotherProfilePage> {
  static const _pregnancyLengthInWeeks = 40;

  final _statusController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _weekController = TextEditingController();
  final _babyNameController = TextEditingController();
  final _babyNicknameController = TextEditingController();
  final _babyDobController = TextEditingController();

  final _picker = ImagePicker();

  _TrackingMode _trackingMode = _TrackingMode.pregnancy;
  DateTime? _dueDate;
  int? _pregnancyWeek = _pregnancyLengthInWeeks;
  DateTime? _babyDateOfBirth;
  Gender? _babyGender;
  _BabyRelationship? _babyRelationship = _BabyRelationship.child;
  XFile? _avatar;

  @override
  void initState() {
    super.initState();
    _statusController.text = _trackingMode.label;
    final initialDueDate = _today;
    _dueDate = initialDueDate;
    _pregnancyWeek = _pregnancyLengthInWeeks;
    _weekController.text = 'Tuần $_pregnancyWeek';
    _dueDateController.text = DateFormat('dd/MM/yyyy').format(initialDueDate);
  }

  @override
  void dispose() {
    _statusController.dispose();
    _dueDateController.dispose();
    _weekController.dispose();
    _babyNameController.dispose();
    _babyNicknameController.dispose();
    _babyDobController.dispose();
    super.dispose();
  }

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  IconData get _trackingModeIcon {
    switch (_trackingMode) {
      case _TrackingMode.pregnancy:
        return Icons.pregnant_woman_rounded;
      case _TrackingMode.baby:
        return Icons.child_care_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo hồ sơ')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trạng thái theo dõi',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[900],
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _statusController,
                      readOnly: true,
                      onTap: _showTrackingModeSheet,
                      decoration: InputDecoration(
                        hintText: 'Chọn trạng thái theo dõi',
                        prefixIcon: Icon(_trackingModeIcon),
                        suffixIcon: Icon(IconsaxPlusLinear.arrow_down),
                      ),
                    ),
                    const SizedBox(height: 36),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      child: _trackingMode == _TrackingMode.pregnancy
                          ? _PregnancyForm(
                              key: const ValueKey('pregnancy-form'),
                              dueDateController: _dueDateController,
                              weekController: _weekController,
                              onSelectDueDate: _pickDueDate,
                              onSelectWeek: _showPregnancyWeekPicker,
                            )
                          : _BabyForm(
                              key: const ValueKey('baby-form'),
                              avatar: _avatar == null
                                  ? null
                                  : File(_avatar!.path),
                              babyNameController: _babyNameController,
                              babyNicknameController: _babyNicknameController,
                              babyDobController: _babyDobController,
                              babyGender: _babyGender,
                              relationship: _babyRelationship,
                              onPickAvatar: _showAvatarSheet,
                              onPickDob: _pickBabyDateOfBirth,
                              onGenderChanged: (value) {
                                setState(() => _babyGender = value);
                              },
                              onRelationshipChanged: (value) {
                                setState(() => _babyRelationship = value);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showTrackingModeSheet() async {
    await SelectOptionBottomSheet.show<void>(
      context,
      title: 'Chọn trạng thái theo dõi',
      options: [
        SelectOptionBottomSheetOption(
          title: _TrackingMode.pregnancy.label,
          icon: Icons.pregnant_woman_rounded,
          iconColor: const Color(0xFFE76F51),
          iconBackground: const Color(0xFFFFEFEA),
          onTap: (_) async {
            if (!mounted) return;
            setState(() {
              _trackingMode = _TrackingMode.pregnancy;
              _statusController.text = _trackingMode.label;
            });
          },
        ),
        SelectOptionBottomSheetOption(
          title: _TrackingMode.baby.label,
          icon: Icons.child_care_rounded,
          iconColor: const Color(0xFF2A9D8F),
          iconBackground: const Color(0xFFE8F7F5),
          onTap: (_) async {
            if (!mounted) return;
            setState(() {
              _trackingMode = _TrackingMode.baby;
              _statusController.text = _trackingMode.label;
            });
          },
        ),
      ],
    );
  }

  Future<void> _pickDueDate() async {
    final initial = _dueDate ?? _today.add(const Duration(days: 7));
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: initial,
      firstDate: _today,
      lastDate: _today.add(const Duration(days: 280)),
    );
    if (!mounted || picked == null) return;
    _applyDueDate(picked);
  }

  Future<void> _showPregnancyWeekPicker() async {
    final selected = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return _PregnancyWeekSheet(initialValue: _pregnancyWeek);
      },
    );
    if (!mounted || selected == null) return;
    _applyPregnancyWeek(selected);
  }

  void _applyDueDate(DateTime value) {
    final dueDate = DateTime(value.year, value.month, value.day);
    final daysUntilDue = dueDate.difference(_today).inDays;
    final week = (_pregnancyLengthInWeeks - (daysUntilDue / 7).floor()).clamp(
      1,
      _pregnancyLengthInWeeks,
    );

    setState(() {
      _dueDate = dueDate;
      _pregnancyWeek = week;
      _dueDateController.text = DateFormat('dd/MM/yyyy').format(dueDate);
      _weekController.text = 'Tuần $week';
    });
  }

  void _applyPregnancyWeek(int value) {
    final week = value.clamp(1, _pregnancyLengthInWeeks);
    final dueDate = _today.add(
      Duration(days: (_pregnancyLengthInWeeks - week) * 7),
    );

    setState(() {
      _pregnancyWeek = week;
      _dueDate = dueDate;
      _weekController.text = 'Tuần $week';
      _dueDateController.text = DateFormat('dd/MM/yyyy').format(dueDate);
    });
  }

  Future<void> _showAvatarSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return SafeArea(
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
                _AvatarActionTile(
                  icon: IconsaxPlusLinear.camera,
                  title: context.l10n.profile_avatar_take_photo,
                  onTap: () async {
                    Navigator.of(context).pop();
                    await _pickAvatar(ImageSource.camera);
                  },
                ),
                _AvatarActionTile(
                  icon: IconsaxPlusLinear.gallery,
                  title: context.l10n.profile_avatar_pick_from_gallery,
                  onTap: () async {
                    Navigator.of(context).pop();
                    await _pickAvatar(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickAvatar(ImageSource source) async {
    try {
      final file = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
      );
      if (!mounted || file == null) return;
      setState(() => _avatar = file);
    } catch (e, st) {
      log('pickAvatar error: $e', stackTrace: st);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.profile_avatar_pick_error)),
      );
    }
  }

  Future<void> _pickBabyDateOfBirth() async {
    final now = _today;
    final initial = _babyDateOfBirth ?? now;
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: now,
    );
    if (!mounted || picked == null) return;
    setState(() {
      _babyDateOfBirth = picked;
      _babyDobController.text = DateFormat('dd/MM/yyyy').format(picked);
    });
  }
}

enum _TrackingMode {
  pregnancy('Theo dõi thai kỳ'),
  baby('Theo dõi bé yêu');

  const _TrackingMode(this.label);

  final String label;
}

enum _BabyRelationship {
  child('Con'),
  other('Khác');

  const _BabyRelationship(this.label);

  final String label;
}

class _PregnancyForm extends StatelessWidget {
  const _PregnancyForm({
    super.key,
    required this.dueDateController,
    required this.weekController,
    required this.onSelectDueDate,
    required this.onSelectWeek,
  });

  final TextEditingController dueDateController;
  final TextEditingController weekController;
  final VoidCallback onSelectDueDate;
  final VoidCallback onSelectWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ngày dự sinh',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: dueDateController,
          readOnly: true,
          onTap: onSelectDueDate,
          decoration: const InputDecoration(
            hintText: 'Ngày dự sinh',
            prefixIcon: Icon(IconsaxPlusLinear.calendar_1),
            suffixIcon: Icon(IconsaxPlusLinear.arrow_down),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Hoặc',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Tuần thai',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: weekController,
          readOnly: true,
          onTap: onSelectWeek,
          decoration: const InputDecoration(
            hintText: 'Tuần thai',
            prefixIcon: Icon(IconsaxPlusLinear.health),
            suffixIcon: Icon(IconsaxPlusLinear.arrow_down),
          ),
        ),
      ],
    );
  }
}

class _BabyForm extends StatelessWidget {
  const _BabyForm({
    super.key,
    required this.avatar,
    required this.babyNameController,
    required this.babyNicknameController,
    required this.babyDobController,
    required this.babyGender,
    required this.relationship,
    required this.onPickAvatar,
    required this.onPickDob,
    required this.onGenderChanged,
    required this.onRelationshipChanged,
  });

  final File? avatar;
  final TextEditingController babyNameController;
  final TextEditingController babyNicknameController;
  final TextEditingController babyDobController;
  final Gender? babyGender;
  final _BabyRelationship? relationship;
  final VoidCallback onPickAvatar;
  final VoidCallback onPickDob;
  final ValueChanged<Gender> onGenderChanged;
  final ValueChanged<_BabyRelationship> onRelationshipChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AvatarPicker(file: avatar, onTap: onPickAvatar),
        const SizedBox(height: 16),
        TextFormField(
          controller: babyNameController,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: const InputDecoration(
            hintText: 'Họ tên',
            prefixIcon: Icon(IconsaxPlusLinear.user),
            suffix: _RequiredStar(),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: babyNicknameController,
          textInputAction: TextInputAction.next,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: const InputDecoration(
            hintText: 'Tên thân mật',
            prefixIcon: Icon(IconsaxPlusLinear.user_tag),
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: babyDobController,
          readOnly: true,
          onTap: onPickDob,
          decoration: const InputDecoration(
            hintText: 'Ngày sinh',
            prefixIcon: Icon(IconsaxPlusLinear.calendar_1),
            suffix: _RequiredStar(),
          ),
        ),
        const SizedBox(height: 14),
        _SectionLabel(title: 'Giới tính', required: true),
        const SizedBox(height: 10),
        GenderPicker(value: babyGender, onChanged: onGenderChanged),
        const SizedBox(height: 14),
        _SectionLabel(title: 'Đây là hồ sơ của', required: true),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _BabyRelationship.values.map((item) {
            final isSelected = relationship == item;
            return ChoiceChip(
              selected: isSelected,
              label: Text(item.label),
              onSelected: (_) => onRelationshipChanged(item),
              selectedColor: AppTheme.primaryColor.withValues(alpha: 0.12),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: isSelected ? AppTheme.primaryColor : Colors.grey[800],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _PregnancyWeekSheet extends StatelessWidget {
  const _PregnancyWeekSheet({this.initialValue});

  final int? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Chọn tuần thai',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 360,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 40,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                final week = index + 1;
                final isSelected = initialValue == week;
                return InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => Navigator.of(context).pop(week),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.primaryColor.withValues(alpha: 0.12)
                          : const Color(0xFFF4F6F8),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.primaryColor
                            : const Color(0xFFE4E7EC),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$week',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : const Color(0xFF344054),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title, this.required = false});

  final String title;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}

class _RequiredStar extends StatelessWidget {
  const _RequiredStar();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '*',
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
    );
  }
}

class _AvatarPicker extends StatelessWidget {
  const _AvatarPicker({required this.file, required this.onTap});

  final File? file;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 104,
              height: 104,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(5),
              child: ClipOval(
                child: file == null
                    ? Container(
                        color: AppTheme.primaryColor.withValues(alpha: 0.08),
                        child: Icon(
                          Icons.child_care_rounded,
                          size: 46,
                          color: AppTheme.primaryColor.withValues(alpha: 0.75),
                        ),
                      )
                    : Image.file(file!, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: -2,
              bottom: -2,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Icon(
                  IconsaxPlusLinear.camera,
                  size: 18,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarActionTile extends StatelessWidget {
  const _AvatarActionTile({
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
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: AppTheme.primaryColor),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.grey[900],
        ),
      ),
      trailing: Icon(IconsaxPlusLinear.arrow_right_3, color: Colors.grey[500]),
    );
  }
}
