import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get app_title;

  /// No description provided for @dashboard_hospital_name.
  ///
  /// In en, this message translates to:
  /// **'INTERNATIONAL GENERAL HOSPITAL'**
  String get dashboard_hospital_name;

  /// No description provided for @dashboard_hospital_city.
  ///
  /// In en, this message translates to:
  /// **'HAI PHONG'**
  String get dashboard_hospital_city;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your username and password'**
  String get auth_login_subtitle;

  /// No description provided for @auth_login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login;

  /// No description provided for @auth_logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get auth_logout;

  /// No description provided for @auth_login_error_required.
  ///
  /// In en, this message translates to:
  /// **'Please enter all the required information'**
  String get auth_login_error_required;

  /// No description provided for @auth_username_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your account'**
  String get auth_username_hint;

  /// No description provided for @auth_username_label.
  ///
  /// In en, this message translates to:
  /// **'Phone number / Email'**
  String get auth_username_label;

  /// No description provided for @auth_password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password_label;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get auth_password_hint;

  /// No description provided for @auth_forgot_password_link.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get auth_forgot_password_link;

  /// No description provided for @auth_register_prompt.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have an account yet?'**
  String get auth_register_prompt;

  /// No description provided for @auth_register_link.
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get auth_register_link;

  /// No description provided for @auth_register_title.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get auth_register_title;

  /// No description provided for @auth_confirm_password_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get auth_confirm_password_label;

  /// No description provided for @auth_confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get auth_confirm_password_hint;

  /// No description provided for @auth_required_field_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter all the required information'**
  String get auth_required_field_error;

  /// No description provided for @auth_password_mismatch_error.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation does not match'**
  String get auth_password_mismatch_error;

  /// No description provided for @auth_terms_not_accepted_error.
  ///
  /// In en, this message translates to:
  /// **'Please accept the Terms of Use and Privacy Policy'**
  String get auth_terms_not_accepted_error;

  /// No description provided for @register_success_toast.
  ///
  /// In en, this message translates to:
  /// **'Registered successfully (demo)'**
  String get register_success_toast;

  /// No description provided for @terms_prefix.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to '**
  String get terms_prefix;

  /// No description provided for @terms_terms_link.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms_terms_link;

  /// No description provided for @terms_and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get terms_and;

  /// No description provided for @terms_policy_link.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy of Hai Phong International General Hospital'**
  String get terms_policy_link;

  /// No description provided for @terms_suffix.
  ///
  /// In en, this message translates to:
  /// **' and consent to the hospital processing my personal data according to applicable personal data protection law.'**
  String get terms_suffix;

  /// No description provided for @forgot_password_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get forgot_password_continue;

  /// No description provided for @forgot_password_invalid_input.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid information'**
  String get forgot_password_invalid_input;

  /// No description provided for @forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgot_password_title;

  /// No description provided for @auth_confirm_otp_title.
  ///
  /// In en, this message translates to:
  /// **'Phone/Email verification'**
  String get auth_confirm_otp_title;

  /// No description provided for @auth_otp_sent_message.
  ///
  /// In en, this message translates to:
  /// **'The OTP code has been sent to the following phone number/email:'**
  String get auth_otp_sent_message;

  /// No description provided for @auth_confirm_button.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get auth_confirm_button;

  /// No description provided for @auth_resend_otp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get auth_resend_otp;

  /// No description provided for @auth_resend_otp_timer.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP ({seconds}s)'**
  String auth_resend_otp_timer(Object seconds);

  /// No description provided for @auth_otp_length_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter all {length} OTP digits'**
  String auth_otp_length_error(Object length);

  /// No description provided for @auth_otp_invalid_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP code'**
  String get auth_otp_invalid_error;

  /// No description provided for @auth_otp_success_toast.
  ///
  /// In en, this message translates to:
  /// **'OTP verification successful (demo)'**
  String get auth_otp_success_toast;

  /// No description provided for @auth_otp_resent_toast.
  ///
  /// In en, this message translates to:
  /// **'OTP resent (demo)'**
  String get auth_otp_resent_toast;

  /// No description provided for @common_placeholder_unknown.
  ///
  /// In en, this message translates to:
  /// **'-'**
  String get common_placeholder_unknown;

  /// No description provided for @dashboard_appointments.
  ///
  /// In en, this message translates to:
  /// **'My visits'**
  String get dashboard_appointments;

  /// No description provided for @dashboard_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get dashboard_contact;

  /// No description provided for @dashboard_community_qna.
  ///
  /// In en, this message translates to:
  /// **'Health Q&A'**
  String get dashboard_community_qna;

  /// No description provided for @dashboard_vaccination_record.
  ///
  /// In en, this message translates to:
  /// **'Vaccine'**
  String get dashboard_vaccination_record;

  /// No description provided for @dashboard_parenting_guide.
  ///
  /// In en, this message translates to:
  /// **'Motherhood'**
  String get dashboard_parenting_guide;

  /// No description provided for @dashboard_teleconsultation.
  ///
  /// In en, this message translates to:
  /// **'Remote health consultation'**
  String get dashboard_teleconsultation;

  /// No description provided for @dashboard_prescriptions.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get dashboard_prescriptions;

  /// No description provided for @account_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get account_language;

  /// No description provided for @account_language_current.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get account_language_current;

  /// No description provided for @account_section_requests_title.
  ///
  /// In en, this message translates to:
  /// **'Requests & Offers'**
  String get account_section_requests_title;

  /// No description provided for @account_request_medication_delivery.
  ///
  /// In en, this message translates to:
  /// **'Medication delivery request'**
  String get account_request_medication_delivery;

  /// No description provided for @account_request_customer_support.
  ///
  /// In en, this message translates to:
  /// **'Customer support request'**
  String get account_request_customer_support;

  /// No description provided for @account_my_offers.
  ///
  /// In en, this message translates to:
  /// **'My offers'**
  String get account_my_offers;

  /// No description provided for @account_section_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get account_section_settings_title;

  /// No description provided for @account_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get account_change_password;

  /// No description provided for @account_security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get account_security;

  /// No description provided for @account_security_not_set.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get account_security_not_set;

  /// No description provided for @account_section_terms_title.
  ///
  /// In en, this message translates to:
  /// **'Terms & policies'**
  String get account_section_terms_title;

  /// No description provided for @account_terms_of_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get account_terms_of_use;

  /// No description provided for @account_complaint_policy.
  ///
  /// In en, this message translates to:
  /// **'Complaint & dispute resolution policy'**
  String get account_complaint_policy;

  /// No description provided for @account_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get account_privacy_policy;

  /// No description provided for @account_faq.
  ///
  /// In en, this message translates to:
  /// **'App FAQ'**
  String get account_faq;

  /// No description provided for @account_share_app.
  ///
  /// In en, this message translates to:
  /// **'Share the app'**
  String get account_share_app;

  /// No description provided for @account_logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get account_logout;

  /// No description provided for @account_guest_label.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get account_guest_label;

  /// No description provided for @account_guest_prompt.
  ///
  /// In en, this message translates to:
  /// **'You are in Guest mode.\nSign in to access full features.'**
  String get account_guest_prompt;

  /// No description provided for @account_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get account_sign_in_button;

  /// No description provided for @account_hospital_contact.
  ///
  /// In en, this message translates to:
  /// **'INTERNATIONAL GENERAL HOSPITAL HAI PHONG\n124 Nguyen Duc Canh, Cat Dai, Le Chan District, Hai Phong'**
  String get account_hospital_contact;

  /// No description provided for @main_tab_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get main_tab_home;

  /// No description provided for @main_tab_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get main_tab_profile;

  /// No description provided for @main_tab_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get main_tab_notifications;

  /// No description provided for @main_tab_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get main_tab_account;

  /// No description provided for @main_fab_label.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get main_fab_label;

  /// No description provided for @main_fab_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Create booking'**
  String get main_fab_tooltip;

  /// No description provided for @notification_title.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification_title;

  /// No description provided for @notification_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get notification_empty_title;

  /// No description provided for @notification_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get notification_empty_subtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
