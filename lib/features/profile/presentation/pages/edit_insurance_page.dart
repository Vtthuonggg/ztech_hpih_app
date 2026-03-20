import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/core/widgets/custom_date_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EditInsurancePage extends ConsumerStatefulWidget {
  static const path = '/edit-insurance';

  const EditInsurancePage({
    super.key,
    required this.isPrivateInsurance,
    this.editData,
  });

  final bool isPrivateInsurance;
  final Map<String, dynamic>? editData;

  @override
  ConsumerState<EditInsurancePage> createState() => _EditInsurancePageState();
}

class _EditInsurancePageState extends ConsumerState<EditInsurancePage> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _registrationLocationController = TextEditingController();
  final _expirationDateController = TextEditingController();

  DateTime? _expirationDate;
  bool _submitting = false;

  bool get _isEditMode => widget.editData != null;

  bool get _canSubmit {
    if (_submitting) return false;
    if (_codeController.text.trim().isEmpty) return false;
    if (_registrationLocationController.text.trim().isEmpty) return false;
    if (widget.isPrivateInsurance && _expirationDate == null) return false;
    return true;
  }

  @override
  void initState() {
    super.initState();
    _codeController.text = _stringOrEmpty(widget.editData?['code']);
    _registrationLocationController.text = _stringOrEmpty(
      widget.editData?['registration_location'],
    );
    final rawExpirationDate = widget.editData?['expiration_date'];
    if (rawExpirationDate is String && rawExpirationDate.trim().isNotEmpty) {
      try {
        _expirationDate = DateTime.parse(rawExpirationDate);
        _expirationDateController.text = _formatDate(_expirationDate!);
      } catch (_) {}
    }
    _codeController.addListener(_refresh);
    _registrationLocationController.addListener(_refresh);
    _expirationDateController.addListener(_refresh);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _registrationLocationController.dispose();
    _expirationDateController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isPrivateInsurance
        ? 'bảo hiểm tư nhân'
        : 'bảo hiểm y tế';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditMode ? 'Sửa $title' : 'Thêm $title',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _codeController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Số thẻ',
                    prefixIcon: Icon(IconsaxPlusLinear.card),
                    suffix: _RequiredStar(),
                  ),
                  validator: (value) {
                    if ((value ?? '').trim().isEmpty) return 'Bắt buộc';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _registrationLocationController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: widget.isPrivateInsurance
                      ? TextInputAction.next
                      : TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Nơi đăng ký',
                    prefixIcon: Icon(IconsaxPlusLinear.location),
                    suffix: _RequiredStar(),
                  ),
                  validator: (value) {
                    if ((value ?? '').trim().isEmpty) return 'Bắt buộc';
                    return null;
                  },
                ),
                if (widget.isPrivateInsurance) ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _expirationDateController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: 'Ngày hết hạn',
                      prefixIcon: Icon(IconsaxPlusLinear.calendar),
                      suffix: _RequiredStar(),
                    ),
                    onTap: _pickExpirationDate,
                    validator: (_) {
                      if (_expirationDate == null) return 'Bắt buộc';
                      return null;
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: _canSubmit ? _submit : null,
              child: _submitting
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Hoàn tất'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickExpirationDate() async {
    final now = DateTime.now();
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: _expirationDate ?? now,
      firstDate: DateTime(now.year - 1, 1, 1),
      lastDate: DateTime(now.year + 30, 12, 31),
    );
    if (!mounted || picked == null) return;
    setState(() {
      _expirationDate = picked;
      _expirationDateController.text = _formatDate(picked);
    });
  }

  Future<void> _submit() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid || !_canSubmit) return;

    setState(() => _submitting = true);
    try {
      final payload = <String, dynamic>{
        'code': _codeController.text.trim(),
        'registration_location': _registrationLocationController.text.trim(),
        'is_private_insurance': widget.isPrivateInsurance,
        if (widget.isPrivateInsurance)
          'expiration_date': _expirationDate?.toIso8601String(),
        if (_isEditMode) 'id': widget.editData?['id'],
      };

      log('EditInsurance payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditMode
                ? 'Đã cập nhật thông tin bảo hiểm (mô phỏng).'
                : 'Đã thêm thông tin bảo hiểm (mô phỏng).',
          ),
        ),
      );
      context.pop(payload);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String _stringOrEmpty(dynamic value) => value?.toString() ?? '';

  String _formatDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString();
    return '$day/$month/$year';
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
