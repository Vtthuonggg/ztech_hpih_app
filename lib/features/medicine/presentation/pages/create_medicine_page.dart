import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ztech_hpih_app/core/widgets/form_label.dart';
import 'package:ztech_hpih_app/core/widgets/multi_image_picker.dart';
// ignore_for_file: unused_field

class CreateMedicinePage extends StatefulWidget {
  static const path = '/create-medicine';
  const CreateMedicinePage({super.key});

  @override
  State<CreateMedicinePage> createState() => _CreateMedicinePageState();
}

class _CreateMedicinePageState extends State<CreateMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _branchController = TextEditingController();

  List<XFile> _images = [];

  @override
  void dispose() {
    _noteController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _branchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Tạo đơn thuốc')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Ảnh ──────────────────────────────────────────────────
                const FormSectionLabel(title: 'Ảnh đơn thuốc'),
                const SizedBox(height: 12),
                MultiImagePicker(
                  maxCount: 5,
                  onChanged: (images) => _images = images,
                ),

                // ── Ghi chú ──────────────────────────────────────────────
                const SizedBox(height: 20),
                const FormSectionLabel(title: 'Ghi chú'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _noteController,
                  maxLines: 4,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    hintText: 'Nhập ghi chú (nếu có)...',
                    alignLabelWithHint: true,
                    filled: true,
                  ),
                ),

                // ── Thông tin liên hệ ─────────────────────────────────────
                const SizedBox(height: 28),
                const FormSectionLabel(title: 'Nhập thông tin liên hệ'),
                const SizedBox(height: 12),

                // Họ tên *
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: 'Họ tên đầy đủ',
                    prefixIcon: const Icon(IconsaxPlusLinear.user),
                    suffix: const RequiredStar(),
                    filled: true,
                  ),
                  validator: (v) =>
                      (v ?? '').trim().isEmpty ? 'Vui lòng nhập họ tên' : null,
                ),
                const SizedBox(height: 12),

                // Số điện thoại *
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: 'Số điện thoại',
                    prefixIcon: const Icon(IconsaxPlusLinear.call),
                    suffix: const RequiredStar(),
                    filled: true,
                  ),
                  validator: (v) => (v ?? '').trim().isEmpty
                      ? 'Vui lòng nhập số điện thoại'
                      : null,
                ),
                const SizedBox(height: 12),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(IconsaxPlusLinear.sms),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 12),

                // Chi nhánh *
                TextFormField(
                  controller: _branchController,
                  textInputAction: TextInputAction.done,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: 'Chi nhánh ĐKQT Hải Phòng gần nhất',
                    prefixIcon: const Icon(IconsaxPlusLinear.location),
                    suffix: const RequiredStar(),
                    filled: true,
                  ),
                  validator: (v) => (v ?? '').trim().isEmpty
                      ? 'Vui lòng nhập chi nhánh'
                      : null,
                ),

                const SizedBox(height: 32),

                // ── Nút gửi ──────────────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // TODO: xử lý submit
                      }
                    },
                    child: const Text('GỬI'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
