// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get app_title => 'Health';

  @override
  String get dashboard_hospital_name => 'BỆNH VIỆN ĐA KHOA QUỐC TẾ';

  @override
  String get dashboard_hospital_city => 'HẢI PHÒNG';

  @override
  String get auth_login_subtitle => 'Nhập tài khoản và mật khẩu';

  @override
  String get auth_login => 'Đăng nhập';

  @override
  String get auth_logout => 'Đăng xuất';

  @override
  String get auth_login_error_required => 'Vui lòng nhập đầy đủ thông tin';

  @override
  String get auth_username_hint => 'Nhập tài khoản của bạn';

  @override
  String get auth_username_label => 'Số điện thoại / Email';

  @override
  String get auth_password_label => 'Mật khẩu';

  @override
  String get auth_password_hint => 'Nhập mật khẩu của bạn';

  @override
  String get auth_forgot_password_link => 'Quên mật khẩu?';

  @override
  String get auth_register_prompt => 'Bạn chưa có tài khoản?';

  @override
  String get auth_register_link => 'Đăng ký ngay';

  @override
  String get auth_register_title => 'Tạo tài khoản mới';

  @override
  String get auth_confirm_password_label => 'Xác nhận mật khẩu';

  @override
  String get auth_confirm_password_hint => 'Nhập lại mật khẩu';

  @override
  String get auth_required_field_error => 'Vui lòng nhập đầy đủ thông tin';

  @override
  String get auth_password_mismatch_error =>
      'Mật khẩu xác nhận không trùng khớp';

  @override
  String get auth_terms_not_accepted_error =>
      'Vui lòng đồng ý với Quy định sử dụng và Chính sách bảo vệ dữ liệu cá nhân';

  @override
  String get register_success_toast => 'Đăng ký thành công (demo)';

  @override
  String get terms_prefix => 'Tôi đã đọc và đồng ý với ';

  @override
  String get terms_terms_link => 'Quy định sử dụng';

  @override
  String get terms_and => ' và ';

  @override
  String get terms_policy_link =>
      'Chính sách bảo vệ dữ liệu cá nhân của Bệnh viện Đa Khoa Quốc Tế Hải Phòng';

  @override
  String get terms_suffix =>
      ' và chấp thuận để bệnh viện xử lý dữ liệu cá nhân của tôi theo quy định của pháp luật về bảo vệ dữ liệu cá nhân.';

  @override
  String get forgot_password_continue => 'Tiếp tục';

  @override
  String get forgot_password_invalid_input => 'Vui lòng nhập thông tin hợp lệ';

  @override
  String get forgot_password_title => 'Quên mật khẩu';

  @override
  String get auth_confirm_otp_title => 'Xác thực số điện thoại/email';

  @override
  String get auth_otp_sent_message =>
      'Mã xác thực OTP đã được gửi đến số điện thoại/email sau:';

  @override
  String get auth_confirm_button => 'Xác nhận';

  @override
  String get auth_resend_otp => 'Gửi lại OTP';

  @override
  String auth_resend_otp_timer(Object seconds) {
    return 'Gửi lại OTP (${seconds}s)';
  }

  @override
  String auth_otp_length_error(Object length) {
    return 'Vui lòng nhập đủ $length chữ số OTP';
  }

  @override
  String get auth_otp_invalid_error => 'Mã OTP không đúng';

  @override
  String get auth_otp_success_toast => 'Xác thực OTP thành công (demo)';

  @override
  String get auth_otp_resent_toast => 'Đã gửi lại OTP (demo)';

  @override
  String get common_placeholder_unknown => '-';

  @override
  String get dashboard_appointments => 'Lịch hẹn';

  @override
  String get dashboard_contact => 'Liên hệ';

  @override
  String get dashboard_community_qna => 'Cộng đồng hỏi đáp';

  @override
  String get dashboard_vaccination_record => 'Sổ tiêm';

  @override
  String get dashboard_parenting_guide => 'Cẩm nang làm mẹ';

  @override
  String get dashboard_teleconsultation => 'Tư vấn sức khoẻ từ xa';

  @override
  String get dashboard_prescriptions => 'Đơn thuốc';

  @override
  String get account_language => 'Ngôn ngữ';

  @override
  String get account_language_current => 'Tiếng Việt';

  @override
  String get account_section_requests_title => 'Quản lý yêu cầu và ưu đãi';

  @override
  String get account_request_medication_delivery => 'Yêu cầu giao thuốc';

  @override
  String get account_request_customer_support => 'Yêu cầu hỗ trợ CSKH';

  @override
  String get account_my_offers => 'Ưu đãi của tôi';

  @override
  String get account_section_settings_title => 'Cài đặt';

  @override
  String get account_change_password => 'Đổi mật khẩu';

  @override
  String get account_security => 'Bảo mật';

  @override
  String get account_security_not_set => 'Chưa thiết lập';

  @override
  String get account_section_terms_title => 'Điều khoản & quy định';

  @override
  String get account_terms_of_use => 'Quy định sử dụng';

  @override
  String get account_complaint_policy =>
      'Chính sách giải quyết khiếu nại, tranh chấp';

  @override
  String get account_privacy_policy => 'Chính sách bảo vệ dữ liệu cá nhân';

  @override
  String get account_faq => 'Hỏi đáp về ứng dụng';

  @override
  String get account_share_app => 'Chia sẻ ứng dụng';

  @override
  String get account_logout => 'Đăng xuất';

  @override
  String get account_guest_label => 'Khách';

  @override
  String get account_guest_prompt =>
      'Bạn đang ở chế độ Khách.\nĐăng nhập để sử dụng đầy đủ tính năng.';

  @override
  String get account_sign_in_button => 'Đăng nhập';

  @override
  String get account_hospital_contact =>
      'BỆNH VIỆN ĐA KHOA QUỐC TẾ HẢI PHÒNG\n124 Nguyễn Đức Cảnh, Cát Dài, Quận Lê Chân, Hải Phòng';

  @override
  String get main_tab_home => 'Trang chủ';

  @override
  String get main_tab_profile => 'Hồ sơ';

  @override
  String get main_tab_notifications => 'Thông báo';

  @override
  String get main_tab_account => 'Tài khoản';

  @override
  String get main_fab_label => 'Đặt lịch';

  @override
  String get main_fab_tooltip => 'Tạo lịch hẹn';

  @override
  String get notification_title => 'Thông báo';

  @override
  String get notification_empty_title => 'Chưa có thông báo';

  @override
  String get notification_empty_subtitle => 'Sắp ra mắt';
}
