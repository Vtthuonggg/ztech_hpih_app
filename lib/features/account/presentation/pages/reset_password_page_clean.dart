import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// Clean replacement for the broken `reset_password_page.dart`.
/// Use this file while we resolve the corrupted file issue.
class ResetPasswordPageClean extends StatefulWidget {
  const ResetPasswordPageClean({super.key});

  @override
  State<ResetPasswordPageClean> createState() => _ResetPasswordPageCleanState();
}

class _ResetPasswordPageCleanState extends State<ResetPasswordPageClean> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  String _errorMessage = '';

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đổi mật khẩu')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),

                // Current password
                TextFormField(
                  controller: _currentController,
                  obscureText: _obscureCurrent,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu hiện tại',
                    hintText: 'Nhập mật khẩu hiện tại',
                    prefixIcon: Icon(IconsaxPlusLinear.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureCurrent
                            ? IconsaxPlusLinear.eye_slash
                            : IconsaxPlusLinear.eye,
                      ),
                      onPressed: () =>
                          setState(() => _obscureCurrent = !_obscureCurrent),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // New password
                TextFormField(
                  controller: _newController,
                  obscureText: _obscureNew,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu mới',
                    hintText: 'Nhập mật khẩu mới',
                    prefixIcon: Icon(IconsaxPlusLinear.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNew
                            ? IconsaxPlusLinear.eye_slash
                            : IconsaxPlusLinear.eye,
                      ),
                      onPressed: () =>
                          setState(() => _obscureNew = !_obscureNew),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Confirm new password
                TextFormField(
                  controller: _confirmController,
                  obscureText: _obscureConfirm,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSave(),
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu mới',
                    hintText: 'Nhập lại mật khẩu mới',
                    prefixIcon: Icon(IconsaxPlusLinear.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? IconsaxPlusLinear.eye_slash
                            : IconsaxPlusLinear.eye,
                      ),
                      onPressed: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                ),

                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleSave,
                  child: const Text('Xác nhận'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSave() async {
    final newPwd = _newController.text;
    final confirm = _confirmController.text;

    if (newPwd != confirm) {
      setState(() => _errorMessage = 'Mật khẩu xác nhận không trùng khớp');
      return;
    }

    setState(() => _errorMessage = '');

    // Placeholder for API call to verify current password and save new password.
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đổi mật khẩu thành công')));
    Navigator.of(context).pop();
  }
}
