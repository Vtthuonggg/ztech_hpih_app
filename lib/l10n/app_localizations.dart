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

  /// No description provided for @profile_section_general_title.
  ///
  /// In en, this message translates to:
  /// **'General information'**
  String get profile_section_general_title;

  /// No description provided for @profile_personal_info.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get profile_personal_info;

  /// No description provided for @profile_health_info.
  ///
  /// In en, this message translates to:
  /// **'Health information'**
  String get profile_health_info;

  /// No description provided for @profile_relatives_title.
  ///
  /// In en, this message translates to:
  /// **'Family profiles'**
  String get profile_relatives_title;

  /// No description provided for @profile_select_profile.
  ///
  /// In en, this message translates to:
  /// **'Select profile'**
  String get profile_select_profile;

  /// No description provided for @profile_add_profile_by_code.
  ///
  /// In en, this message translates to:
  /// **'Add profile by medical code'**
  String get profile_add_profile_by_code;

  /// No description provided for @profile_add_profile_by_form.
  ///
  /// In en, this message translates to:
  /// **'Add profile by manual entry'**
  String get profile_add_profile_by_form;

  /// No description provided for @profile_add_profile_button.
  ///
  /// In en, this message translates to:
  /// **'ADD PROFILE'**
  String get profile_add_profile_button;

  /// No description provided for @profile_guest_label.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get profile_guest_label;

  /// No description provided for @profile_add_by_code_title.
  ///
  /// In en, this message translates to:
  /// **'Add profile by code'**
  String get profile_add_by_code_title;

  /// No description provided for @profile_add_by_code_tab_input.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get profile_add_by_code_tab_input;

  /// No description provided for @profile_add_by_code_tab_scan.
  ///
  /// In en, this message translates to:
  /// **'Scan code'**
  String get profile_add_by_code_tab_scan;

  /// No description provided for @profile_add_by_code_instructions.
  ///
  /// In en, this message translates to:
  /// **'Enter profile code to search'**
  String get profile_add_by_code_instructions;

  /// No description provided for @profile_add_by_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter profile code'**
  String get profile_add_by_code_hint;

  /// No description provided for @profile_add_by_code_search_button.
  ///
  /// In en, this message translates to:
  /// **'Find profile'**
  String get profile_add_by_code_search_button;

  /// No description provided for @profile_add_by_code_scanning_checking.
  ///
  /// In en, this message translates to:
  /// **'Checking code...'**
  String get profile_add_by_code_scanning_checking;

  /// No description provided for @profile_add_by_code_scanning_instruction.
  ///
  /// In en, this message translates to:
  /// **'Place the code inside the frame to scan automatically'**
  String get profile_add_by_code_scanning_instruction;

  /// No description provided for @profile_add_by_code_no_scanned.
  ///
  /// In en, this message translates to:
  /// **'No code scanned yet'**
  String get profile_add_by_code_no_scanned;

  /// No description provided for @profile_add_by_code_last_scanned.
  ///
  /// In en, this message translates to:
  /// **'Last scanned code: {code}'**
  String profile_add_by_code_last_scanned(Object code);

  /// No description provided for @profile_add_by_code_checked_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Checked profile code: {code} (mock).'**
  String profile_add_by_code_checked_snackbar(Object code);

  /// No description provided for @profile_add_form_title.
  ///
  /// In en, this message translates to:
  /// **'Add profile'**
  String get profile_add_form_title;

  /// No description provided for @profile_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profile_name_hint;

  /// No description provided for @profile_nickname_hint.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get profile_nickname_hint;

  /// No description provided for @profile_dob_hint.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get profile_dob_hint;

  /// No description provided for @profile_phone_hint.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get profile_phone_hint;

  /// No description provided for @profile_email_optional_hint.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get profile_email_optional_hint;

  /// No description provided for @profile_gender_label.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profile_gender_label;

  /// No description provided for @profile_relationship_label.
  ///
  /// In en, this message translates to:
  /// **'This profile is for'**
  String get profile_relationship_label;

  /// No description provided for @profile_required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get profile_required;

  /// No description provided for @profile_phone_invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get profile_phone_invalid;

  /// No description provided for @profile_email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get profile_email_invalid;

  /// No description provided for @profile_finish_button.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get profile_finish_button;

  /// No description provided for @profile_avatar_take_photo.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get profile_avatar_take_photo;

  /// No description provided for @profile_avatar_pick_from_gallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get profile_avatar_pick_from_gallery;

  /// No description provided for @profile_avatar_pick_error.
  ///
  /// In en, this message translates to:
  /// **'Unable to pick image. Please try again.'**
  String get profile_avatar_pick_error;

  /// No description provided for @profile_add_success_toast.
  ///
  /// In en, this message translates to:
  /// **'Profile added (mock).'**
  String get profile_add_success_toast;

  /// No description provided for @profile_relationship_child.
  ///
  /// In en, this message translates to:
  /// **'Child'**
  String get profile_relationship_child;

  /// No description provided for @profile_relationship_wife.
  ///
  /// In en, this message translates to:
  /// **'Wife'**
  String get profile_relationship_wife;

  /// No description provided for @profile_relationship_husband.
  ///
  /// In en, this message translates to:
  /// **'Husband'**
  String get profile_relationship_husband;

  /// No description provided for @profile_relationship_father.
  ///
  /// In en, this message translates to:
  /// **'Father'**
  String get profile_relationship_father;

  /// No description provided for @profile_relationship_mother.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get profile_relationship_mother;

  /// No description provided for @profile_relationship_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get profile_relationship_other;

  /// No description provided for @profile_additional_title.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get profile_additional_title;

  /// No description provided for @profile_identify_code_hint.
  ///
  /// In en, this message translates to:
  /// **'ID card / Passport number'**
  String get profile_identify_code_hint;

  /// No description provided for @profile_job_hint.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get profile_job_hint;

  /// No description provided for @profile_address_hint.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profile_address_hint;

  /// No description provided for @profile_nationality_hint.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get profile_nationality_hint;

  /// No description provided for @profile_nation_hint.
  ///
  /// In en, this message translates to:
  /// **'Ethnicity'**
  String get profile_nation_hint;

  /// No description provided for @profile_additional_submitted_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Additional information submitted (mock).'**
  String get profile_additional_submitted_snackbar;

  /// No description provided for @profile_basic_info_title.
  ///
  /// In en, this message translates to:
  /// **'Basic information'**
  String get profile_basic_info_title;

  /// No description provided for @profile_edit_button.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profile_edit_button;

  /// No description provided for @profile_add_button.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get profile_add_button;

  /// No description provided for @profile_company_info_title.
  ///
  /// In en, this message translates to:
  /// **'Company information'**
  String get profile_company_info_title;

  /// No description provided for @profile_insurance_title.
  ///
  /// In en, this message translates to:
  /// **'Insurance information'**
  String get profile_insurance_title;

  /// No description provided for @profile_insurance_health.
  ///
  /// In en, this message translates to:
  /// **'Health insurance'**
  String get profile_insurance_health;

  /// No description provided for @profile_insurance_private.
  ///
  /// In en, this message translates to:
  /// **'Private insurance'**
  String get profile_insurance_private;

  /// No description provided for @profile_label_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profile_label_full_name;

  /// No description provided for @profile_label_dob.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get profile_label_dob;

  /// No description provided for @profile_label_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get profile_label_phone;

  /// No description provided for @profile_label_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profile_label_email;

  /// No description provided for @profile_label_gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get profile_label_gender;

  /// No description provided for @profile_company_name.
  ///
  /// In en, this message translates to:
  /// **'Company name'**
  String get profile_company_name;

  /// No description provided for @profile_company_tax_code.
  ///
  /// In en, this message translates to:
  /// **'Tax code'**
  String get profile_company_tax_code;

  /// No description provided for @profile_company_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profile_company_address;

  /// No description provided for @profile_edit_basic_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Edit basic profile'**
  String get profile_edit_basic_profile_title;

  /// No description provided for @profile_company_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit company information'**
  String get profile_company_edit_title;

  /// No description provided for @profile_company_add_title.
  ///
  /// In en, this message translates to:
  /// **'Add company information'**
  String get profile_company_add_title;

  /// No description provided for @profile_company_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Company name'**
  String get profile_company_name_hint;

  /// No description provided for @profile_company_tax_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Tax code'**
  String get profile_company_tax_code_hint;

  /// No description provided for @profile_company_address_hint.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get profile_company_address_hint;

  /// No description provided for @profile_company_updated_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Company information updated (mock).'**
  String get profile_company_updated_snackbar;

  /// No description provided for @profile_company_added_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Company information added (mock).'**
  String get profile_company_added_snackbar;

  /// No description provided for @profile_insurance_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Insurance number'**
  String get profile_insurance_number_hint;

  /// No description provided for @profile_insurance_registration_location_hint.
  ///
  /// In en, this message translates to:
  /// **'Registration location'**
  String get profile_insurance_registration_location_hint;

  /// No description provided for @profile_insurance_expiration_date_hint.
  ///
  /// In en, this message translates to:
  /// **'Expiration date'**
  String get profile_insurance_expiration_date_hint;

  /// No description provided for @profile_insurance_updated_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Insurance information updated (mock).'**
  String get profile_insurance_updated_snackbar;

  /// No description provided for @profile_insurance_added_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Insurance information added (mock).'**
  String get profile_insurance_added_snackbar;

  /// No description provided for @profile_general_health_title.
  ///
  /// In en, this message translates to:
  /// **'General health'**
  String get profile_general_health_title;

  /// No description provided for @profile_overview_title.
  ///
  /// In en, this message translates to:
  /// **'Basic health metrics'**
  String get profile_overview_title;

  /// No description provided for @profile_label_blood_type.
  ///
  /// In en, this message translates to:
  /// **'Blood type'**
  String get profile_label_blood_type;

  /// No description provided for @profile_label_height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get profile_label_height;

  /// No description provided for @profile_label_weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get profile_label_weight;

  /// No description provided for @profile_blood_type_unknown.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get profile_blood_type_unknown;

  /// No description provided for @profile_decimal_input_hint.
  ///
  /// In en, this message translates to:
  /// **'You can enter decimals, e.g. 165.5 cm or 52.3 kg.'**
  String get profile_decimal_input_hint;

  /// No description provided for @profile_invalid_value.
  ///
  /// In en, this message translates to:
  /// **'Invalid value'**
  String get profile_invalid_value;

  /// No description provided for @profile_unit_cm.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get profile_unit_cm;

  /// No description provided for @profile_unit_kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get profile_unit_kg;

  /// No description provided for @profile_height_weight_title.
  ///
  /// In en, this message translates to:
  /// **'Height & weight'**
  String get profile_height_weight_title;

  /// No description provided for @profile_height_weight_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter basic metrics to complete the health profile.'**
  String get profile_height_weight_subtitle;

  /// No description provided for @profile_general_health_saved_snackbar.
  ///
  /// In en, this message translates to:
  /// **'General health saved (mock).'**
  String get profile_general_health_saved_snackbar;

  /// No description provided for @profile_blood_type_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Skip selecting blood type if you don\'t have the information.'**
  String get profile_blood_type_subtitle;

  /// No description provided for @profile_life_style_title.
  ///
  /// In en, this message translates to:
  /// **'Life-style habits'**
  String get profile_life_style_title;

  /// No description provided for @profile_allergy_information_title.
  ///
  /// In en, this message translates to:
  /// **'Allergy information'**
  String get profile_allergy_information_title;

  /// No description provided for @dashboard_section_new_services.
  ///
  /// In en, this message translates to:
  /// **'New services'**
  String get dashboard_section_new_services;

  /// No description provided for @dashboard_service_customer_portal_title.
  ///
  /// In en, this message translates to:
  /// **'Customer service portal'**
  String get dashboard_service_customer_portal_title;

  /// No description provided for @dashboard_service_customer_portal_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Fast - Convenient - Easy'**
  String get dashboard_service_customer_portal_subtitle;

  /// No description provided for @dashboard_service_quick_booking_title.
  ///
  /// In en, this message translates to:
  /// **'Quick booking - Auto confirm'**
  String get dashboard_service_quick_booking_title;

  /// No description provided for @dashboard_service_quick_booking_subtitle.
  ///
  /// In en, this message translates to:
  /// **'View appointment slots and confirmations from anywhere'**
  String get dashboard_service_quick_booking_subtitle;

  /// No description provided for @dashboard_question_screening_title.
  ///
  /// In en, this message translates to:
  /// **'Health screening questions'**
  String get dashboard_question_screening_title;

  /// No description provided for @dashboard_news_category_title.
  ///
  /// In en, this message translates to:
  /// **'News categories'**
  String get dashboard_news_category_title;

  /// No description provided for @dashboard_important_notify_title.
  ///
  /// In en, this message translates to:
  /// **'Important notices'**
  String get dashboard_important_notify_title;

  /// No description provided for @dashboard_new_badge.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get dashboard_new_badge;

  /// No description provided for @dashboard_latest_news_title.
  ///
  /// In en, this message translates to:
  /// **'Latest news'**
  String get dashboard_latest_news_title;

  /// No description provided for @profile_gender_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get profile_gender_male;

  /// No description provided for @profile_gender_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get profile_gender_female;
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
