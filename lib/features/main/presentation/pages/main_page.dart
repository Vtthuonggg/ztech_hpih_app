import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import 'package:healthcare_app/core/theme/app_theme.dart';
import 'package:healthcare_app/features/book_visit/presentation/pages/select_branch_page.dart';
import 'package:healthcare_app/features/notification/presentation/pages/notification_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/presentation/providers/auth_state.dart';
import '../../../book_visit/presentation/pages/create_book_visit_page.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class MainPage extends ConsumerWidget {
  static const path = '/main';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        unauthenticated: () {
          context.go(LoginPage.path);
        },
        orElse: () {},
      );
    });
    final l10n = context.l10n;
    return Scaffold(
      body: _buildBody(ref.watch(currentIndexProvider)),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () async {
                final branchApiValue = await showSelectBranchSheet(context);
                if (branchApiValue != null && context.mounted) {
                  context.push(
                    CreateBookVisitPage.path,
                    extra: {'branch': branchApiValue},
                  );
                }
              },
              backgroundColor: AppTheme.accentColor,
              elevation: 0,
              child: const Icon(
                IconsaxPlusLinear.calendar,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.main_fab_label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildItem(
                  context,
                  ref,
                  IconsaxPlusLinear.home_2,
                  IconsaxPlusBold.home_2,
                  l10n.main_tab_home,
                  0,
                ),
                _buildItem(
                  context,
                  ref,
                  IconsaxPlusLinear.personalcard,
                  IconsaxPlusBold.personalcard,
                  l10n.main_tab_profile,
                  1,
                ),
                const SizedBox(width: 60),
                _buildItem(
                  context,
                  ref,
                  IconsaxPlusLinear.notification,
                  IconsaxPlusBold.notification,
                  l10n.main_tab_notifications,
                  3,
                ),
                _buildItem(
                  context,
                  ref,
                  IconsaxPlusLinear.user,
                  IconsaxPlusBold.user,
                  l10n.main_tab_account,
                  4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 1:
        return const ProfilePage();
      case 3:
        return const NotificationPage();
      case 4:
        return const AccountPage();
      case 0:
      default:
        return const DashBoardPage();
    }
  }

  Widget _buildItem(
    BuildContext context,
    WidgetRef ref,
    IconData icon,
    IconData activeIcon,
    String title,
    int index,
  ) {
    final currentIndex = ref.watch(currentIndexProvider);
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(currentIndexProvider.notifier).state = index;
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[400],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
