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

  @override
  String get profile_section_general_title => 'General information';

  @override
  String get profile_personal_info => 'Personal information';

  @override
  String get profile_health_info => 'Health information';

  @override
  String get profile_relatives_title => 'Family profiles';

  @override
  String get profile_select_profile => 'Select profile';

  @override
  String get profile_add_profile_by_code => 'Add profile by medical code';

  @override
  String get profile_add_profile_by_form => 'Add profile by manual entry';

  @override
  String get profile_add_profile_button => 'ADD PROFILE';

  @override
  String get profile_guest_label => 'Guest';

  @override
  String get profile_add_by_code_title => 'Add profile by code';

  @override
  String get profile_add_by_code_tab_input => 'Enter code';

  @override
  String get profile_add_by_code_tab_scan => 'Scan code';

  @override
  String get profile_add_by_code_instructions => 'Enter profile code to search';

  @override
  String get profile_add_by_code_hint => 'Enter profile code';

  @override
  String get profile_add_by_code_search_button => 'Find profile';

  @override
  String get profile_add_by_code_scanning_checking => 'Checking code...';

  @override
  String get profile_add_by_code_scanning_instruction =>
      'Place the code inside the frame to scan automatically';

  @override
  String get profile_add_by_code_no_scanned => 'No code scanned yet';

  @override
  String profile_add_by_code_last_scanned(Object code) {
    return 'Last scanned code: $code';
  }

  @override
  String profile_add_by_code_checked_snackbar(Object code) {
    return 'Checked profile code: $code (mock).';
  }

  @override
  String get profile_add_form_title => 'Add profile';

  @override
  String get profile_name_hint => 'Full name';

  @override
  String get profile_nickname_hint => 'Nickname';

  @override
  String get profile_dob_hint => 'Date of birth';

  @override
  String get profile_phone_hint => 'Phone number';

  @override
  String get profile_email_optional_hint => 'Email (optional)';

  @override
  String get profile_gender_label => 'Gender';

  @override
  String get profile_relationship_label => 'This profile is for';

  @override
  String get profile_required => 'Required';

  @override
  String get profile_phone_invalid => 'Invalid phone number';

  @override
  String get profile_email_invalid => 'Invalid email';

  @override
  String get profile_finish_button => 'Finish';

  @override
  String get profile_avatar_take_photo => 'Take photo';

  @override
  String get profile_avatar_pick_from_gallery => 'Choose from gallery';

  @override
  String get profile_avatar_pick_error =>
      'Unable to pick image. Please try again.';

  @override
  String get profile_add_success_toast => 'Profile added (mock).';

  @override
  String get profile_relationship_child => 'Child';

  @override
  String get profile_relationship_wife => 'Wife';

  @override
  String get profile_relationship_husband => 'Husband';

  @override
  String get profile_relationship_father => 'Father';

  @override
  String get profile_relationship_mother => 'Mother';

  @override
  String get profile_relationship_other => 'Other';

  @override
  String get profile_additional_title => 'Additional information';

  @override
  String get profile_identify_code_hint => 'ID card / Passport number';

  @override
  String get profile_job_hint => 'Occupation';

  @override
  String get profile_address_hint => 'Address';

  @override
  String get profile_nationality_hint => 'Nationality';

  @override
  String get profile_nation_hint => 'Ethnicity';

  @override
  String get profile_additional_submitted_snackbar =>
      'Additional information submitted (mock).';

  @override
  String get profile_basic_info_title => 'Basic information';

  @override
  String get profile_edit_button => 'Edit';

  @override
  String get profile_add_button => 'Add';

  @override
  String get profile_company_info_title => 'Company information';

  @override
  String get profile_insurance_title => 'Insurance information';

  @override
  String get profile_insurance_health => 'Health insurance';

  @override
  String get profile_insurance_private => 'Private insurance';

  @override
  String get profile_label_full_name => 'Full name';

  @override
  String get profile_label_dob => 'Date of birth';

  @override
  String get profile_label_phone => 'Phone number';

  @override
  String get profile_label_email => 'Email';

  @override
  String get profile_label_gender => 'Gender';

  @override
  String get profile_company_name => 'Company name';

  @override
  String get profile_company_tax_code => 'Tax code';

  @override
  String get profile_company_address => 'Address';

  @override
  String get profile_edit_basic_profile_title => 'Edit basic profile';

  @override
  String get profile_company_edit_title => 'Edit company information';

  @override
  String get profile_company_add_title => 'Add company information';

  @override
  String get profile_company_name_hint => 'Company name';

  @override
  String get profile_company_tax_code_hint => 'Tax code';

  @override
  String get profile_company_address_hint => 'Address';

  @override
  String get profile_company_updated_snackbar =>
      'Company information updated (mock).';

  @override
  String get profile_company_added_snackbar =>
      'Company information added (mock).';

  @override
  String get profile_insurance_number_hint => 'Insurance number';

  @override
  String get profile_insurance_registration_location_hint =>
      'Registration location';

  @override
  String get profile_insurance_expiration_date_hint => 'Expiration date';

  @override
  String get profile_insurance_updated_snackbar =>
      'Insurance information updated (mock).';

  @override
  String get profile_insurance_added_snackbar =>
      'Insurance information added (mock).';

  @override
  String get profile_general_health_title => 'General health';

  @override
  String get profile_overview_title => 'Basic health metrics';

  @override
  String get profile_label_blood_type => 'Blood type';

  @override
  String get profile_label_height => 'Height';

  @override
  String get profile_label_weight => 'Weight';

  @override
  String get profile_blood_type_unknown => 'Not specified';

  @override
  String get profile_decimal_input_hint =>
      'You can enter decimals, e.g. 165.5 cm or 52.3 kg.';

  @override
  String get profile_invalid_value => 'Invalid value';

  @override
  String get profile_unit_cm => 'cm';

  @override
  String get profile_unit_kg => 'kg';

  @override
  String get profile_height_weight_title => 'Height & weight';

  @override
  String get profile_height_weight_subtitle =>
      'Enter basic metrics to complete the health profile.';

  @override
  String get profile_general_health_saved_snackbar =>
      'General health saved (mock).';

  @override
  String get profile_blood_type_subtitle =>
      'Skip selecting blood type if you don\'t have the information.';

  @override
  String get profile_life_style_title => 'Life-style habits';

  @override
  String get profile_allergy_information_title => 'Allergy information';

  @override
  String get dashboard_section_new_services => 'New services';

  @override
  String get dashboard_service_customer_portal_title =>
      'Customer service portal';

  @override
  String get dashboard_service_customer_portal_subtitle =>
      'Fast - Convenient - Easy';

  @override
  String get dashboard_service_quick_booking_title =>
      'Quick booking - Auto confirm';

  @override
  String get dashboard_service_quick_booking_subtitle =>
      'View appointment slots and confirmations from anywhere';

  @override
  String get dashboard_question_screening_title => 'Health screening questions';

  @override
  String get dashboard_news_category_title => 'News categories';

  @override
  String get dashboard_important_notify_title => 'Important notices';

  @override
  String get dashboard_new_badge => 'New';

  @override
  String get dashboard_latest_news_title => 'Latest news';

  @override
  String get profile_gender_male => 'Male';

  @override
  String get profile_gender_female => 'Female';
}
