import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/features/account/presentation/pages/language_page.dart';
import 'package:healthcare_app/features/account/presentation/pages/reset_password_page.dart';
import 'package:healthcare_app/features/auth/presentation/pages/confirm_otp_page.dart';
import 'package:healthcare_app/features/dashboard/presentation/pages/contact_page.dart';
import 'package:healthcare_app/features/book_visit/presentation/pages/create_book_visit_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/add_profile_by_code_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/add_profile_form_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/additional_information_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/detail_profile_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_basic_profile_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_company_info_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_insurance_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/general_health_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/health_infomation_page.dart';
import '../../features/auth/presentation/pages/forget_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/providers/auth_state.dart';
import '../../features/main/presentation/pages/main_page.dart';
import 'transition_helper.dart';

class _GoRouterRefreshNotifier extends ChangeNotifier {
  _GoRouterRefreshNotifier(Ref ref) {
    _sub = ref.listen<AuthState>(authProvider, (previous, next) {
      notifyListeners();
    });
  }

  late final ProviderSubscription<AuthState> _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = _GoRouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);
  return GoRouter(
    initialLocation: LoginPage.path,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authProvider);
      const publicPaths = <String>{
        LoginPage.path,
        RegisterPage.path,
        ForgetPasswordPage.path,
        ConfirmOtpPage.path,
      };
      return authState.maybeWhen(
        authenticated: (_) {
          if (publicPaths.contains(state.matchedLocation)) {
            return MainPage.path;
          }
          return null;
        },
        unauthenticated: () {
          if (!publicPaths.contains(state.matchedLocation)) {
            return LoginPage.path;
          }
          return null;
        },
        orElse: () => null,
      );
    },
    routes: [
      GoRoute(
        path: LoginPage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.fade(state, const LoginPage()),
      ),
      GoRoute(
        path: RegisterPage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.slideRightToLeft(state, const RegisterPage()),
      ),
      GoRoute(
        path: DetailProfilePage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.slideRightToLeft(state, const DetailProfilePage()),
      ),
      GoRoute(
        path: EditBasicProfilePage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const EditBasicProfilePage(),
        ),
      ),
      GoRoute(
        path: AdditionalInformationPage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const AdditionalInformationPage(),
        ),
      ),
      GoRoute(
        path: EditInsurancePage.path,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? const {};
          return TransitionHelper.slideRightToLeft(
            state,
            EditInsurancePage(
              isPrivateInsurance:
                  extra['is_private_insurance'] as bool? ?? false,
              editData: extra['edit_data'] as Map<String, dynamic>?,
            ),
          );
        },
      ),
      GoRoute(
        path: EditCompanyInfoPage.path,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? const {};
          return TransitionHelper.slideRightToLeft(
            state,
            EditCompanyInfoPage(
              editData: extra['edit_data'] as Map<String, dynamic>?,
            ),
          );
        },
      ),
      GoRoute(
        path: ForgetPasswordPage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const ForgetPasswordPage(),
        ),
      ),
      GoRoute(
        path: ConfirmOtpPage.path,
        pageBuilder: (context, state) {
          final username =
              (state.extra as String?) ??
              state.uri.queryParameters['username'] ??
              '';
          return TransitionHelper.slideRightToLeft(
            state,
            ConfirmOtpPage(username: username),
          );
        },
      ),
      GoRoute(
        path: MainPage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.fade(state, MainPage()),
      ),
      GoRoute(
        path: ContactPage.path,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          opaque: false,
          barrierColor: Colors.transparent,
          child: const ContactPage(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        ),
      ),
      GoRoute(
        path: AddProfileByCodePage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const AddProfileByCodePage(),
        ),
      ),
      GoRoute(
        path: AddProfileFormPage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const AddProfileFormPage(),
        ),
      ),
      GoRoute(
        path: HealthInfomationPage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const HealthInfomationPage(),
        ),
      ),
      GoRoute(
        path: GeneralHealthPage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.slideRightToLeft(state, const GeneralHealthPage()),
      ),
      GoRoute(
        path: CreateBookVisitPage.path,
        pageBuilder: (context, state) => TransitionHelper.slideRightToLeft(
          state,
          const CreateBookVisitPage(),
        ),
      ),
      GoRoute(
        path: ResetPasswordPage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.slideRightToLeft(state, const ResetPasswordPage()),
      ),
      GoRoute(
        path: LanguagePage.path,
        pageBuilder: (context, state) =>
            TransitionHelper.slideRightToLeft(state, const LanguagePage()),
      ),
    ],
  );
});
