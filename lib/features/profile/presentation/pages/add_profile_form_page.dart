import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import 'package:healthcare_app/core/widgets/custom_date_picker.dart';
import 'package:healthcare_app/core/widgets/gender_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/theme/app_theme.dart';

class AddProfileFormPage extends ConsumerStatefulWidget {
  static const path = '/add-profile-form';

  const AddProfileFormPage({super.key});

  @override
  ConsumerState<AddProfileFormPage> createState() => _AddProfileFormPageState();
}

class _AddProfileFormPageState extends ConsumerState<AddProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _picker = ImagePicker();

  DateTime? _dateOfBirth;
  Gender? _gender;
  _Relationship? _relationship;
  XFile? _avatar;
  bool _submitting = false;

  bool get _canSubmit {
    return !_submitting &&
        _nameController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _dateOfBirth != null &&
        _gender != null &&
        _relationship != null;
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_refresh);
    _phoneController.addListener(_refresh);
    _dobController.addListener(_refresh);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nickNameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.profile_add_form_title,
          style: const TextStyle(fontWeight: FontWeight.w600),
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
                _AvatarPicker(
                  file: _avatar == null ? null : File(_avatar!.path),
                  onTap: _showAvatarSheet,
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _nameController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_name_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.user),
                    suffix: _RequiredStar(),
                  ),
                  validator: (value) {
                    if ((value ?? '').trim().isEmpty) {
                      return l10n.profile_required;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nickNameController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_nickname_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.user_tag),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _dobController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: l10n.profile_dob_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.cake),
                    suffix: _RequiredStar(),
                  ),
                  onTap: _pickDateOfBirth,
                  validator: (_) {
                    if (_dateOfBirth == null) return l10n.profile_required;
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.profile_phone_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.call),
                    suffix: _RequiredStar(),
                  ),
                  validator: (value) {
                    final v = (value ?? '').trim();
                    if (v.isEmpty) return l10n.profile_required;
                    if (v.length < 9) return l10n.profile_phone_invalid;
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: l10n.profile_email_optional_hint,
                    prefixIcon: Icon(IconsaxPlusLinear.sms),
                  ),
                  validator: (value) {
                    final v = (value ?? '').trim();
                    if (v.isEmpty) return null;
                    final ok = RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(v);
                    if (!ok) return l10n.profile_email_invalid;
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text: l10n.profile_gender_label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                    ),
                    children: const [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GenderPicker(
                  value: _gender,
                  onChanged: (value) => setState(() => _gender = value),
                ),
                const SizedBox(height: 12),
                _RelationshipField(
                  value: _relationship,
                  onChanged: (value) => setState(() => _relationship = value),
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

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final initial = _dateOfBirth ?? DateTime(now.year - 20, now.month, now.day);
    final picked = await CustomDatePicker.show(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (!mounted || picked == null) return;
    setState(() {
      _dateOfBirth = picked;
      _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
    });
  }

  Future<void> _submit() async {
    final formOk = _formKey.currentState?.validate() ?? false;
    if (!formOk || !_canSubmit) return;

    setState(() => _submitting = true);
    try {
      final payload = <String, dynamic>{
        'relationship': _relationship?.apiValue,
        'name': _nameController.text.trim(),
        'nick_name': _nickNameController.text.trim().isEmpty
            ? null
            : _nickNameController.text.trim(),
        'date_of_birth': DateFormat('yyyy-MM-dd').format(_dateOfBirth!),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim().isEmpty
            ? null
            : _emailController.text.trim(),
        'general': _gender!.apiValue,
      };

      log('AddProfileForm payload: $payload');
      await Future<void>.delayed(const Duration(milliseconds: 900));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đã thêm hồ sơ (mô phỏng).')),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }
}

enum _Relationship { child, wife, husband, father, mother, other }

extension RelationshipLabel on _Relationship {
  String label(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case _Relationship.child:
        return l10n.profile_relationship_child;
      case _Relationship.wife:
        return l10n.profile_relationship_wife;
      case _Relationship.husband:
        return l10n.profile_relationship_husband;
      case _Relationship.father:
        return l10n.profile_relationship_father;
      case _Relationship.mother:
        return l10n.profile_relationship_mother;
      case _Relationship.other:
        return l10n.profile_relationship_other;
    }
  }

  String get apiValue {
    switch (this) {
      case _Relationship.child:
        return 'child';
      case _Relationship.wife:
        return 'wife';
      case _Relationship.husband:
        return 'husband';
      case _Relationship.father:
        return 'father';
      case _Relationship.mother:
        return 'mother';
      case _Relationship.other:
        return 'other';
    }
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
                          IconsaxPlusLinear.user,
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

class _RelationshipField extends FormField<_Relationship> {
  _RelationshipField({
    required _Relationship? value,
    required ValueChanged<_Relationship> onChanged,
  }) : super(
         initialValue: value,
         builder: (state) {
           final selected = state.value;
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text.rich(
                 TextSpan(
                   text: state.context.l10n.profile_relationship_label,
                   style: Theme.of(state.context).textTheme.titleSmall
                       ?.copyWith(
                         fontWeight: FontWeight.w700,
                         color: Colors.grey[800],
                       ),
                   children: const [
                     TextSpan(
                       text: ' *',
                       style: TextStyle(
                         fontWeight: FontWeight.w900,
                         color: Colors.red,
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 10),
               Wrap(
                 spacing: 10,
                 runSpacing: 10,
                 children: _Relationship.values.map((item) {
                   final isSelected = selected == item;
                   return ChoiceChip(
                     selected: isSelected,
                     label: Text(item.label(state.context)),
                     onSelected: (_) {
                       state.didChange(item);
                       onChanged(item);
                     },
                     selectedColor: AppTheme.primaryColor.withValues(
                       alpha: 0.12,
                     ),
                     labelStyle: TextStyle(
                       fontWeight: FontWeight.w700,
                       color: isSelected
                           ? AppTheme.primaryColor
                           : Colors.grey[800],
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     ),
                   );
                 }).toList(),
               ),
             ],
           );
         },
       );

  @override
  FormFieldState<_Relationship> createState() =>
      FormFieldState<_Relationship>();
}
