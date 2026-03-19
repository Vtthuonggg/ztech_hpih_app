import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EditCompanyInfoPage extends ConsumerStatefulWidget {
  static const path = '/edit-company-info';

  const EditCompanyInfoPage({super.key, this.editData});

  final Map<String, dynamic>? editData;

  @override
  ConsumerState<EditCompanyInfoPage> createState() => _EditCompanyInfoState();
}

class _EditCompanyInfoState extends ConsumerState<EditCompanyInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _taxCodeController = TextEditingController();
  final _addressController = TextEditingController();

  bool _submitting = false;

  bool get _isEditMode => widget.editData != null;

  @override
  void initState() {
    super.initState();
    _companyNameController.text = _stringOrEmpty(widget.editData?['name']);
    _taxCodeController.text = _stringOrEmpty(widget.editData?['tax_code']);
    _addressController.text = _stringOrEmpty(widget.editData?['address']);
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _taxCodeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          _isEditMode ? 'Sửa thông tin công ty' : 'Thêm thông tin công ty',
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
                  controller: _companyNameController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Tên doanh nghiệp',
                    prefixIcon: Icon(IconsaxPlusLinear.building_4),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _taxCodeController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Mã số thuế',
                    prefixIcon: Icon(IconsaxPlusLinear.card),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'Địa chỉ',
                    prefixIcon: Icon(IconsaxPlusLinear.location),
                  ),
                  maxLines: 2,
                  minLines: 1,
                ),
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
              onPressed: _submitting ? null : _submit,
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

  Future<void> _submit() async {
    final valid = _formKey.currentState?.validate() ?? true;
    if (!valid) return;

    setState(() => _submitting = true);
    try {
      final payload = <String, dynamic>{
        'name': _nullIfEmpty(_companyNameController.text),
        'tax_code': _nullIfEmpty(_taxCodeController.text),
        'address': _nullIfEmpty(_addressController.text),
        if (_isEditMode) 'id': widget.editData?['id'],
      };

      log('EditCompanyInfo payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditMode
                ? 'Đã cập nhật thông tin công ty (mô phỏng).'
                : 'Đã thêm thông tin công ty (mô phỏng).',
          ),
        ),
      );
      context.pop(payload);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String _stringOrEmpty(dynamic value) => value?.toString() ?? '';

  String? _nullIfEmpty(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
