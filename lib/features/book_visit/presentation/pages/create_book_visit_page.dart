import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_date_picker.dart';
import '../../../../core/widgets/gender_picker.dart';

class CreateBookVisitPage extends ConsumerStatefulWidget {
  static const path = '/create-book-visit';

  const CreateBookVisitPage({super.key});

  @override
  ConsumerState<CreateBookVisitPage> createState() =>
      _CreateBookVisitPageState();
}

class _CreateBookVisitPageState extends ConsumerState<CreateBookVisitPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _reasonController = TextEditingController();

  DateTime? _dateOfBirth;
  DateTime? _appointmentDate;
  Gender? _gender;
  _BookingBranch? _branch;
  _AppointmentSession? _appointmentSession;
  bool _isForeignPatient = false;
  bool _submitting = false;

  List<DateTime> get _quickDates => List.generate(
    3,
    (index) => DateTime.now()
        .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)
        .add(Duration(days: index)),
  );

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_rebuild);
    _dobController.addListener(_rebuild);
    _phoneController.addListener(_rebuild);
    _reasonController.addListener(_rebuild);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  bool get _canSubmit {
    return !_submitting &&
        _nameController.text.trim().isNotEmpty &&
        _dateOfBirth != null &&
        _phoneController.text.trim().isNotEmpty &&
        _gender != null &&
        _branch != null &&
        _appointmentDate != null &&
        _appointmentSession != null &&
        _reasonController.text.trim().isNotEmpty;
  }

  void _rebuild() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Đặt lịch khám',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionCard(
                      title: 'Thông tin người đặt lịch',
                      icon: IconsaxPlusLinear.user_edit,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                              hintText: 'Họ và tên',
                              prefixIcon: Icon(IconsaxPlusLinear.user),
                              suffix: _RequiredStar(),
                            ),
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty) {
                                return 'Bắt buộc';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _dobController,
                            readOnly: true,
                            onTap: _pickDateOfBirth,
                            decoration: const InputDecoration(
                              hintText: 'Ngày sinh',
                              prefixIcon: Icon(IconsaxPlusLinear.cake),
                              suffix: _RequiredStar(),
                            ),
                            validator: (_) {
                              if (_dateOfBirth == null) return 'Bắt buộc';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                              hintText: 'Số điện thoại',
                              prefixIcon: Icon(IconsaxPlusLinear.call),
                              suffix: _RequiredStar(),
                            ),
                            validator: (value) {
                              final raw = (value ?? '').trim();
                              if (raw.isEmpty) return 'Bắt buộc';
                              if (raw.length < 9) {
                                return 'Số điện thoại không hợp lệ';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          _SectionLabel(title: 'Giới tính', required: true),
                          const SizedBox(height: 10),
                          GenderPicker(
                            value: _gender,
                            onChanged: (value) =>
                                setState(() => _gender = value),
                          ),
                          const SizedBox(height: 12),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _isForeignPatient,
                            activeColor: AppTheme.primaryColor,
                            onChanged: (value) {
                              setState(
                                () => _isForeignPatient = value ?? false,
                              );
                            },
                            title: const Text(
                              'Đặt hẹn cho người nước ngoài',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Thông tin đặt hẹn',
                      icon: IconsaxPlusLinear.buildings,
                      child: DropdownButtonFormField<_BookingBranch>(
                        initialValue: _branch,
                        decoration: const InputDecoration(
                          hintText: 'Chọn chi nhánh',
                          prefixIcon: Icon(IconsaxPlusLinear.location),
                          suffix: _RequiredStar(),
                        ),
                        items: _BookingBranch.values.map((branch) {
                          return DropdownMenuItem<_BookingBranch>(
                            value: branch,
                            child: Text(branch.label),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => _branch = value),
                        validator: (value) {
                          if (value == null) return 'Bắt buộc';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Lịch hẹn',
                      icon: IconsaxPlusLinear.calendar,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _SectionLabel(
                            title: 'Chọn ngày khám',
                            required: true,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              for (
                                var index = 0;
                                index < _quickDates.length;
                                index++
                              )
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: _DateChip(
                                      label: _formatQuickDate(
                                        _quickDates[index],
                                      ),
                                      selected: _isSameDay(
                                        _appointmentDate,
                                        _quickDates[index],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _appointmentDate = _quickDates[index];
                                          _appointmentSession = null;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: _DateChip(
                                  label: _isQuickDate(_appointmentDate)
                                      ? 'Ngày khác'
                                      : _appointmentDate == null
                                      ? 'Ngày khác'
                                      : DateFormat(
                                          'dd/MM',
                                        ).format(_appointmentDate!),
                                  selected:
                                      _appointmentDate != null &&
                                      !_isQuickDate(_appointmentDate),
                                  onTap: _pickAppointmentDate,
                                  icon: IconsaxPlusLinear.calendar_add,
                                ),
                              ),
                            ],
                          ),
                          if (_appointmentDate != null) ...[
                            const SizedBox(height: 16),
                            const _SectionLabel(
                              title: 'Chọn buổi khám',
                              required: true,
                            ),
                            const SizedBox(height: 10),
                            _SessionPicker(
                              value: _appointmentSession,
                              onChanged: (value) {
                                setState(() => _appointmentSession = value);
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Lý do khám',
                      icon: IconsaxPlusLinear.note_text,
                      child: TextFormField(
                        controller: _reasonController,
                        minLines: 5,
                        maxLines: 7,
                        textInputAction: TextInputAction.newline,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        decoration: const InputDecoration(
                          hintText:
                              'Nhập lý do khám, triệu chứng hoặc nhu cầu tư vấn',
                          alignLabelWithHint: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(bottom: 88),
                            child: Icon(
                              IconsaxPlusLinear.textalign_justifyleft,
                            ),
                          ),
                          suffix: _RequiredStar(),
                        ),
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) return 'Bắt buộc';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _canSubmit ? _submit : null,
                        child: _submitting
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Đặt lịch'),
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

  Future<void> _pickDateOfBirth() async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: _dateOfBirth ?? DateTime(now.year - 20, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (!mounted || picked == null) return;
    setState(() {
      _dateOfBirth = picked;
      _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
    });
  }

  Future<void> _pickAppointmentDate() async {
    FocusScope.of(context).unfocus();
    final today = DateTime.now();
    final firstDate = DateTime(today.year, today.month, today.day);
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: _appointmentDate ?? firstDate,
      firstDate: firstDate,
      lastDate: firstDate.add(const Duration(days: 180)),
    );
    if (!mounted || picked == null) return;
    setState(() {
      _appointmentDate = picked;
      _appointmentSession = null;
    });
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _submitting = true);

    try {
      final payload = <String, dynamic>{
        'name': _nameController.text.trim(),
        'date_of_birth': _dateOfBirth?.toIso8601String(),
        'phone': _phoneController.text.trim(),
        'general': _gender?.apiValue,
        'is_foreign_booking': _isForeignPatient,
        'branch': _branch?.apiValue,
        'appointment_date': _appointmentDate?.toIso8601String(),
        'appointment_session': _appointmentSession?.apiValue,
        'reason': _reasonController.text.trim(),
      };

      log('CreateBookVisit payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 900));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đặt lịch thành công (mô phỏng).')),
      );
      Navigator.of(context).pop(payload);
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  bool _isQuickDate(DateTime? date) {
    if (date == null) return false;
    return _quickDates.any((item) => _isSameDay(item, date));
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatQuickDate(DateTime date) {
    final weekday = switch (date.weekday) {
      DateTime.monday => 'T2',
      DateTime.tuesday => 'T3',
      DateTime.wednesday => 'T4',
      DateTime.thursday => 'T5',
      DateTime.friday => 'T6',
      DateTime.saturday => 'T7',
      DateTime.sunday => 'CN',
      _ => '',
    };
    return '$weekday\n${DateFormat('dd/MM').format(date)}';
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppTheme.primaryColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title, this.required = false});

  final String title;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF101828),
          ),
        ),
        if (required)
          const Text(
            ' *',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
          ),
      ],
    );
  }
}

class _SessionPicker extends StatelessWidget {
  const _SessionPicker({required this.value, required this.onChanged});

  final _AppointmentSession? value;
  final ValueChanged<_AppointmentSession> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<_AppointmentSession>(
      groupValue: value,
      onChanged: (selected) {
        if (selected != null) onChanged(selected);
      },
      child: Row(
        children: _AppointmentSession.values.map((session) {
          final isSelected = value == session;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: session == _AppointmentSession.morning ? 10 : 0,
              ),
              child: InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: () => onChanged(session),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<_AppointmentSession>(
                        value: session,
                        activeColor: AppTheme.primaryColor,
                        visualDensity: VisualDensity.compact,
                      ),
                      Flexible(
                        child: Text(
                          session.label,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? AppTheme.primaryColor
                                : const Color(0xFF344054),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        height: 96,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryColor.withValues(alpha: 0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppTheme.primaryColor : const Color(0xFFE4E7EC),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: selected
                    ? AppTheme.primaryColor
                    : const Color(0xFF667085),
              ),
              const SizedBox(height: 6),
            ],
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                height: 1.35,
                color: selected
                    ? AppTheme.primaryColor
                    : const Color(0xFF344054),
              ),
            ),
          ],
        ),
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
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }
}

enum _BookingBranch {
  leChan('Chi nhánh Lê Chân', 'le_chan'),
  vinhBao('Chi nhánh Vĩnh Bảo', 'vinh_bao');

  const _BookingBranch(this.label, this.apiValue);

  final String label;
  final String apiValue;
}

enum _AppointmentSession {
  morning('Sáng', 'morning'),
  afternoon('Chiều', 'afternoon');

  const _AppointmentSession(this.label, this.apiValue);

  final String label;
  final String apiValue;
}
