import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:ztech_hpih_app/features/auth/presentation/pages/confirm_otp_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ForgetPasswordPage extends ConsumerStatefulWidget {
  static const path = '/forget-password';
  const ForgetPasswordPage({super.key});

  @override
  ConsumerState<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends ConsumerState<ForgetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(l10n.forgot_password_title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                40.verticalSpace,
                TextFormField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    labelText: l10n.auth_username_label,
                    hintText: l10n.auth_username_hint,
                    prefixIcon: Icon(
                      IconsaxPlusLinear.user,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),

                if (_errorMessage.isNotEmpty) ...[
                  8.verticalSpace,
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
                24.verticalSpace,
                ElevatedButton(
                  onPressed: _handleContinue,
                  child: Text(l10n.forgot_password_continue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    if (_usernameController.text.isNotEmpty) {
      context.push(ConfirmOtpPage.path, extra: _usernameController.text);
    } else {
      setState(() {
        _errorMessage = context.l10n.forgot_password_invalid_input;
      });
    }
  }
}
