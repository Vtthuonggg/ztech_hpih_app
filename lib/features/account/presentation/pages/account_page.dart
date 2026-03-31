import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:ztech_hpih_app/core/utils/constant.dart';
import 'package:ztech_hpih_app/features/account/presentation/pages/language_page.dart';
import 'package:ztech_hpih_app/features/account/presentation/pages/reset_password_page.dart';
import 'package:ztech_hpih_app/features/account/presentation/widgets/profile_header.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/auth_state.dart';
import '../../../auth/domain/models/user.dart';
import '../../../../core/theme/app_theme.dart';

class AccountPage extends ConsumerWidget {
  static const path = '/account';
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);
    final AuthState authState = ref.watch(authProvider);
    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );
    final background = Colors.grey[50]!;
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeaderWidget(
              name: user?.fullName ?? '',
              phone: '0865202584',
              avatarUrl: null,
              onCameraPressed: () {},
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 18),
                ..._buildSections(context, ref, isLoggedIn: user != null),
                28.verticalSpace,
                const _AccountFooter(),
                SizedBox(height: kBottomNavigationBarHeight + 24),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSections(
    BuildContext context,
    WidgetRef ref, {
    required bool isLoggedIn,
  }) {
    final l10n = context.l10n;
    final sections = <_AccountSection>[
      _AccountSection(
        title: l10n.account_section_requests_title,
        items: [
          _AccountItem(
            icon: IconsaxPlusLinear.box,
            iconBg: Color(0xFFFFF1DF),
            iconColor: Color(0xFFF7A534),
            title: l10n.account_request_medication_delivery,
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.support,
            iconBg: Color(0xFFE8F7F5),
            iconColor: Color(0xFF26A69A),
            title: l10n.account_request_customer_support,
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.ticket,
            iconBg: Color(0xFFFFEEE8),
            iconColor: Color(0xFFFF7043),
            title: l10n.account_my_offers,
          ),
        ],
      ),
      _AccountSection(
        title: l10n.account_section_settings_title,
        items: [
          _AccountItem(
            icon: IconsaxPlusLinear.lock,
            iconBg: Color(0xFFE8F7F5),
            iconColor: Color(0xFF26A69A),
            title: l10n.account_change_password,
            onTap: () {
              context.push(ResetPasswordPage.path);
            },
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.global,
            iconBg: Color(0xFFFFEDEE),
            iconColor: Color(0xFFEF5350),
            title: context.l10n.account_language,
            trailingText: context.l10n.account_language_current,
            onTap: () {
              context.push(LanguagePage.path);
            },
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.shield_tick,
            iconBg: Color(0xFFEAF2FF),
            iconColor: Color(0xFF3B82F6),
            title: context.l10n.account_security,
            trailingText: 'Chưa thiết lập',
          ),
        ],
      ),
      _AccountSection(
        title: context.l10n.account_section_terms_title,
        items: [
          _AccountItem(
            icon: IconsaxPlusLinear.document_text,
            iconBg: Color(0xFFEAF2FF),
            iconColor: Color(0xFF3B82F6),
            title: l10n.account_terms_of_use,
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.warning_2,
            iconBg: Color(0xFFE6F7FF),
            iconColor: Color(0xFF38BDF8),
            title: l10n.account_complaint_policy,
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.security_safe,
            iconBg: Color(0xFFFFEDEE),
            iconColor: Color(0xFFEF4444),
            title: l10n.account_privacy_policy,
          ),
        ],
      ),
      _AccountSection(
        title: '',
        items: [
          _AccountItem(
            icon: IconsaxPlusLinear.info_circle,
            iconBg: Color(0xFFF1F5F9),
            iconColor: Color(0xFF64748B),
            title: l10n.account_faq,
          ),
          _AccountItem(
            icon: IconsaxPlusLinear.share,
            iconBg: Color(0xFFFFF1DF),
            iconColor: Color(0xFFF59E0B),
            title: l10n.account_share_app,
          ),
        ],
      ),
      if (isLoggedIn)
        _AccountSection(
          title: '',
          items: [
            _AccountItem(
              icon: IconsaxPlusLinear.logout_1,
              iconBg: Color(0xFFFFEDEE),
              iconColor: Color(0xFFEF4444),
              title: l10n.account_logout,
              onTap: () async {
                await ref.read(authProvider.notifier).logout();
              },
            ),
          ],
        ),
    ];

    return sections
        .expand(
          (section) => [
            if (section.title.isNotEmpty) ...[
              Text(
                section.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              12.verticalSpace,
            ] else ...[
              8.verticalSpace,
            ],
            _AccountSectionCard(section: section),
            18.verticalSpace,
          ],
        )
        .toList();
  }
}

class _AccountHeaderContent extends StatelessWidget {
  const _AccountHeaderContent({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fullName = user?.fullName ?? '';
    final name = fullName.trim().isEmpty ? l10n.account_guest_label : fullName;
    final subtitle = user?.department?.name ?? user?.role?.roleName ?? '';

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.85),
            AppTheme.primaryColor.withValues(alpha: 0.5),
            Color(0xFF56CCF2).withValues(alpha: 0.12),
          ],
          stops: [0.0, 0.5, 0.85, 1.0],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            const Positioned(
              left: -90,
              top: 18,
              child: _SoftCircle(size: 200, opacity: 0.10),
            ),
            const Positioned(
              right: -70,
              top: 64,
              child: _SoftCircle(size: 160, opacity: 0.08),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 20),
                    child: Row(
                      children: [
                        _HeaderAvatar(onCameraTap: () {}),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.2,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            if (subtitle.trim().isNotEmpty) ...[
                              6.verticalSpace,
                              Text(
                                subtitle,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Colors.white.withValues(
                                        alpha: 0.90,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarBottomCap extends StatelessWidget {
  const _AppBarBottomCap({required this.background});

  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  const _SoftCircle({required this.size, required this.opacity});

  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({required this.onCameraTap});

  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 43,
            backgroundColor: Colors.grey[200],
            child: Icon(
              IconsaxPlusLinear.profile_circle,
              size: 54,
              color: AppTheme.primaryColor.withValues(alpha: 0.9),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Material(
            color: Colors.white,
            shape: const CircleBorder(),
            elevation: 8,
            shadowColor: Colors.black.withValues(alpha: 0.12),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onCameraTap,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  IconsaxPlusLinear.camera,
                  size: 18,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginPromptCard extends StatelessWidget {
  const _LoginPromptCard({required this.onLogin});
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.account_guest_prompt,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.35,
                color: Colors.grey[800],
              ),
            ),
          ),
          12.horizontalSpace,
          ElevatedButton(onPressed: onLogin, child: Text(l10n.auth_login)),
        ],
      ),
    );
  }
}

class _AccountSectionCard extends StatelessWidget {
  const _AccountSectionCard({required this.section});
  final _AccountSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < section.items.length; i++) ...[
            _AccountItemTile(item: section.items[i]),
            if (i != section.items.length - 1)
              Divider(height: 1, color: Colors.grey[100]),
          ],
        ],
      ),
    );
  }
}

class _AccountItemTile extends StatelessWidget {
  const _AccountItemTile({required this.item});
  final _AccountItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: item.onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: item.iconBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(item.icon, color: item.iconColor),
      ),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.grey[900],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.trailingText != null) ...[
            Text(
              item.trailingText!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[500]),
            ),
            6.horizontalSpace,
          ],
          Icon(IconsaxPlusLinear.arrow_right_3, color: Colors.grey[400]),
        ],
      ),
    );
  }
}

class _AccountFooter extends StatefulWidget {
  const _AccountFooter();

  @override
  State<_AccountFooter> createState() => _AccountFooterState();
}

class _AccountFooterState extends State<_AccountFooter> {
  late final TapGestureRecognizer _phone1Recognizer;
  late final TapGestureRecognizer _phone2Recognizer;

  @override
  void initState() {
    super.initState();
    _phone1Recognizer = TapGestureRecognizer()
      ..onTap = () => launchUrl(Uri.parse('tel:$HOT_LINE_1'));
    _phone2Recognizer = TapGestureRecognizer()
      ..onTap = () => launchUrl(Uri.parse('tel:$HOT_LINE_2'));
  }

  @override
  void dispose() {
    _phone1Recognizer.dispose();
    _phone2Recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: Colors.grey[500], height: 1.35);
    final linkStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppTheme.primaryColor,
      fontWeight: FontWeight.w600,
      height: 1.35,
    );
    final l10n = context.l10n;
    return Column(
      children: [
        Text(
          l10n.account_hospital_contact,
          style: baseStyle,
          textAlign: TextAlign.center,
        ),
        8.verticalSpace,
        Text(
          'dakhoaquocte.hih@gmail.com',
          style: baseStyle,
          textAlign: TextAlign.center,
        ),
        6.verticalSpace,
        Text.rich(
          TextSpan(
            style: baseStyle,
            children: [
              TextSpan(
                text: '0225-3955 888',
                style: linkStyle,
                recognizer: _phone1Recognizer,
              ),
              const TextSpan(text: '  |  '),
              TextSpan(
                text: '0225-3951 115',
                style: linkStyle,
                recognizer: _phone2Recognizer,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _AccountSection {
  const _AccountSection({required this.title, required this.items});
  final String title;
  final List<_AccountItem> items;
}

class _AccountItem {
  const _AccountItem({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    this.trailingText,
    this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String? trailingText;
  final Function()? onTap;
}
