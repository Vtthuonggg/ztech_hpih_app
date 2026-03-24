import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import '../../../../core/utils/toast_helper.dart';
import 'dart:async';
import 'package:sms_autofill/sms_autofill.dart';

class ConfirmOtpPage extends ConsumerStatefulWidget {
  static const path = '/confirm-otp';
  const ConfirmOtpPage({super.key, required this.username});

  final String username;

  @override
  ConsumerState<ConfirmOtpPage> createState() => _ConfirmOtpPageState();
}

class _ConfirmOtpPageState extends ConsumerState<ConfirmOtpPage>
    with CodeAutoFill {
  static const _otpLength = 6;
  static const _initialCountdownSeconds = 100;

  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();
  Timer? _countdownTimer;
  int _secondsRemaining = _initialCountdownSeconds;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();

    listenForCode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _otpFocusNode.requestFocus();
    });

    _startCountdown();
  }

  @override
  void dispose() {
    cancel();
    _countdownTimer?.cancel();
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  void codeUpdated() {
    final newCode = code ?? '';
    _otpController.text = newCode;

    if (newCode.length == _otpLength) {
      _handleConfirm();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final username = widget.username.trim();
    final otp = _otpController.text;
    final canConfirm = otp.length == _otpLength;
    final canResend = _secondsRemaining == 0;
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          l10n.auth_confirm_otp_title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                24.verticalSpace,
                Text(
                  l10n.auth_otp_sent_message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                    height: 1.35,
                  ),
                ),
                8.verticalSpace,
                Text(
                  username.isEmpty ? '-' : username,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                24.verticalSpace,

                GestureDetector(
                  onTap: () => _otpFocusNode.requestFocus(),
                  behavior: HitTestBehavior.opaque,
                  child: Center(child: _OtpBoxes(controller: _otpController)),
                ),

                Opacity(
                  opacity: 0,
                  child: TextField(
                    controller: _otpController,
                    focusNode: _otpFocusNode,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(_otpLength),
                    ],
                    onChanged: (value) {
                      if (!mounted) return;

                      if (_errorMessage.isNotEmpty) {
                        setState(() => _errorMessage = '');
                      } else {
                        setState(() {});
                      }

                      if (value.length == _otpLength) {
                        _handleConfirm();
                      }
                    },
                    onSubmitted: (_) => _handleConfirm(),
                  ),
                ),

                if (_errorMessage.isNotEmpty) ...[
                  12.verticalSpace,
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],

                28.verticalSpace,
                ElevatedButton(
                  onPressed: canConfirm ? _handleConfirm : null,
                  child: Text(l10n.auth_confirm_button),
                ),
                12.verticalSpace,
                TextButton(
                  onPressed: canResend ? _handleResend : null,
                  child: Text(
                    canResend
                        ? l10n.auth_resend_otp
                        : l10n.auth_resend_otp_timer(_secondsRemaining),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    setState(() {
      _secondsRemaining = _initialCountdownSeconds;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (_secondsRemaining <= 1) {
        timer.cancel();
        setState(() {
          _secondsRemaining = 0;
        });
        return;
      }

      setState(() {
        _secondsRemaining -= 1;
      });
    });
  }

  void _handleConfirm() {
    final otp = _otpController.text;

    if (otp.length != _otpLength) {
      setState(() {
        _errorMessage = context.l10n.auth_otp_length_error(_otpLength);
      });
      return;
    }

    TextInput.finishAutofillContext();

    final isValid = otp == "123456";

    if (!isValid) {
      HapticFeedback.lightImpact();

      setState(() {
        _errorMessage = context.l10n.auth_otp_invalid_error;
        _otpController.clear();
      });

      _otpFocusNode.requestFocus();
      return;
    }

    ToastHelper.success(context, message: context.l10n.auth_otp_success_toast);
  }

  void _handleResend() {
    ToastHelper.info(context, message: context.l10n.auth_otp_resent_toast);
    _otpController.clear();
    _otpFocusNode.requestFocus();
    _startCountdown();
  }
}

class _OtpBoxes extends StatelessWidget {
  const _OtpBoxes({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final text = controller.text;
        final activeIndex = text.length.clamp(
          0,
          _ConfirmOtpPageState._otpLength - 1,
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_ConfirmOtpPageState._otpLength, (index) {
            final digit = index < text.length ? text[index] : '';
            final isActive =
                text.length < _ConfirmOtpPageState._otpLength &&
                index == activeIndex;

            return Container(
              width: 44.w,
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isActive
                      ? theme.colorScheme.primary
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Text(
                digit,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
