// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Health';

  @override
  String get dashboard_hospital_name => 'INTERNATIONAL GENERAL HOSPITAL';

  @override
  String get dashboard_hospital_city => 'HAI PHONG';

  @override
  String get auth_login_subtitle => 'Enter your username and password';

  @override
  String get auth_login => 'Login';

  @override
  String get auth_logout => 'Log out';

  @override
  String get auth_login_error_required =>
      'Please enter all the required information';

  @override
  String get auth_username_hint => 'Enter your account';

  @override
  String get auth_username_label => 'Phone number / Email';

  @override
  String get auth_password_label => 'Password';

  @override
  String get auth_password_hint => 'Enter your password';

  @override
  String get auth_forgot_password_link => 'Forgot your password?';

  @override
  String get auth_register_prompt => 'You don\'t have an account yet?';

  @override
  String get auth_register_link => 'Sign up now';

  @override
  String get auth_register_title => 'Create new account';

  @override
  String get auth_confirm_password_label => 'Confirm password';

  @override
  String get auth_confirm_password_hint => 'Re-enter your password';

  @override
  String get auth_required_field_error =>
      'Please enter all the required information';

  @override
  String get auth_password_mismatch_error =>
      'Password confirmation does not match';

  @override
  String get auth_terms_not_accepted_error =>
      'Please accept the Terms of Use and Privacy Policy';

  @override
  String get register_success_toast => 'Registered successfully (demo)';

  @override
  String get terms_prefix => 'I have read and agree to ';

  @override
  String get terms_terms_link => 'Terms of Use';

  @override
  String get terms_and => ' and ';

  @override
  String get terms_policy_link =>
      'Privacy Policy of Hai Phong International General Hospital';

  @override
  String get terms_suffix =>
      ' and consent to the hospital processing my personal data according to applicable personal data protection law.';

  @override
  String get forgot_password_continue => 'Continue';

  @override
  String get forgot_password_invalid_input => 'Please enter valid information';

  @override
  String get forgot_password_title => 'Forgot password';

  @override
  String get auth_confirm_otp_title => 'Phone/Email verification';

  @override
  String get auth_otp_sent_message =>
      'The OTP code has been sent to the following phone number/email:';

  @override
  String get auth_confirm_button => 'Confirm';

  @override
  String get auth_resend_otp => 'Resend OTP';

  @override
  String auth_resend_otp_timer(Object seconds) {
    return 'Resend OTP (${seconds}s)';
  }

  @override
  String auth_otp_length_error(Object length) {
    return 'Please enter all $length OTP digits';
  }

  @override
  String get auth_otp_invalid_error => 'Invalid OTP code';

  @override
  String get auth_otp_success_toast => 'OTP verification successful (demo)';

  @override
  String get auth_otp_resent_toast => 'OTP resent (demo)';

  @override
  String get common_placeholder_unknown => '-';

  @override
  String get dashboard_appointments => 'My visits';

  @override
  String get dashboard_contact => 'Contact';

  @override
  String get dashboard_community_qna => 'Health Q&A';

  @override
  String get dashboard_vaccination_record => 'Vaccine';

  @override
  String get dashboard_parenting_guide => 'Motherhood';

  @override
  String get dashboard_teleconsultation => 'Remote health consultation';

  @override
  String get dashboard_prescriptions => 'Medicine';

  @override
  String get account_language => 'Language';

  @override
  String get account_language_current => 'English';

  @override
  String get account_section_requests_title => 'Requests & Offers';

  @override
  String get account_request_medication_delivery =>
      'Medication delivery request';

  @override
  String get account_request_customer_support => 'Customer support request';

  @override
  String get account_my_offers => 'My offers';

  @override
  String get account_section_settings_title => 'Settings';

  @override
  String get account_change_password => 'Change password';

  @override
  String get account_security => 'Security';

  @override
  String get account_security_not_set => 'Not set';

  @override
  String get account_section_terms_title => 'Terms & policies';

  @override
  String get account_terms_of_use => 'Terms of Use';

  @override
  String get account_complaint_policy =>
      'Complaint & dispute resolution policy';

  @override
  String get account_privacy_policy => 'Privacy policy';

  @override
  String get account_faq => 'App FAQ';

  @override
  String get account_share_app => 'Share the app';

  @override
  String get account_logout => 'Log out';

  @override
  String get account_guest_label => 'Guest';

  @override
  String get account_guest_prompt =>
      'You are in Guest mode.\nSign in to access full features.';

  @override
  String get account_sign_in_button => 'Sign in';

  @override
  String get account_hospital_contact =>
      'INTERNATIONAL GENERAL HOSPITAL HAI PHONG\n124 Nguyen Duc Canh, Cat Dai, Le Chan District, Hai Phong';

  @override
  String get main_tab_home => 'Home';

  @override
  String get main_tab_profile => 'Profile';

  @override
  String get main_tab_notifications => 'Notifications';

  @override
  String get main_tab_account => 'Account';

  @override
  String get main_fab_label => 'Book';

  @override
  String get main_fab_tooltip => 'Create booking';

  @override
  String get notification_title => 'Notifications';

  @override
  String get notification_empty_title => 'No notifications yet';

  @override
  String get notification_empty_subtitle => 'Coming Soon';
}
