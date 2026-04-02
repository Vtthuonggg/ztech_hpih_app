import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';

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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.account_reset_password_title)),
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
                    labelText: l10n.account_current_password_label,
                    hintText: l10n.account_current_password_hint,
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
                    labelText: l10n.account_new_password_label,
                    hintText: l10n.account_new_password_hint,
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
                    labelText: l10n.account_confirm_new_password_label,
                    hintText: l10n.account_confirm_new_password_hint,
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
                  child: Text(l10n.auth_confirm_button),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSave() async {
    final l10n = context.l10n;
    final newPwd = _newController.text;
    final confirm = _confirmController.text;

    if (newPwd != confirm) {
      setState(() => _errorMessage = l10n.auth_password_mismatch_error);
      return;
    }

    setState(() => _errorMessage = '');

    // Placeholder for API call to verify current password and save new password.
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(content: Text(l10n.account_reset_password_success)),
    );
    Navigator.of(context).pop();
  }
}
