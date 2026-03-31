import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AdditionalInformationPage extends ConsumerStatefulWidget {
  static const path = '/additional-information';
  const AdditionalInformationPage({super.key});

  @override
  ConsumerState<AdditionalInformationPage> createState() =>
      _AdditionalInformationPageState();
}

class _AdditionalInformationPageState
    extends ConsumerState<AdditionalInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _identifyCodeController = TextEditingController();
  final _jobController = TextEditingController();
  final _addressController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _nationController = TextEditingController();

  bool _submitting = false;

  @override
  void dispose() {
    _identifyCodeController.dispose();
    _jobController.dispose();
    _addressController.dispose();
    _nationalityController.dispose();
    _nationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.profile_additional_title,
          style: TextStyle(fontWeight: FontWeight.w600),
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
                  controller: _identifyCodeController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_identify_code_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.card),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _jobController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_job_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.briefcase),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_address_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.location),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nationalityController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),

                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_nationality_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.global),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nationController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: l10n.profile_nation_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.flag),
                  ),
                ),
                const SizedBox(height: 4),
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
                  : Text(l10n.profile_finish_button),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final formOk = _formKey.currentState?.validate() ?? true;
    if (!formOk) return;

    setState(() => _submitting = true);
    try {
      final payload = <String, dynamic>{
        'identify_code': _nullIfEmpty(_identifyCodeController.text),
        'job': _nullIfEmpty(_jobController.text),
        'address': _nullIfEmpty(_addressController.text),
        'nationality': _nullIfEmpty(_nationalityController.text),
        'nation': _nullIfEmpty(_nationController.text),
      };

      log('AdditionalInformation payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.profile_additional_submitted_snackbar),
        ),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String? _nullIfEmpty(String value) {
    final v = value.trim();
    return v.isEmpty ? null : v;
  }
}
