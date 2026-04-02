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
  String get common_close => 'Đóng';

  @override
  String get common_confirm => 'Xác nhận';

  @override
  String get common_cancel => 'Hủy';

  @override
  String get common_apply => 'Áp dụng';

  @override
  String get common_ok => 'OK';

  @override
  String get common_select_date => 'Chọn ngày';

  @override
  String get common_select_time => 'Chọn thời gian';

  @override
  String get common_select_date_range => 'Chọn khoảng thời gian';

  @override
  String get common_select_year => 'Chọn năm';

  @override
  String common_select_month_with_year(Object year) {
    return 'Chọn tháng - $year';
  }

  @override
  String get common_hour => 'Giờ';

  @override
  String get common_minute => 'Phút';

  @override
  String get common_toast_success_title => 'Thành công';

  @override
  String get common_toast_error_title => 'Lỗi';

  @override
  String get common_toast_warning_title => 'Cảnh báo';

  @override
  String get common_toast_info_title => 'Thông tin';

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
  String get account_reset_password_title => 'Đổi mật khẩu';

  @override
  String get account_current_password_label => 'Mật khẩu hiện tại';

  @override
  String get account_current_password_hint => 'Nhập mật khẩu hiện tại';

  @override
  String get account_new_password_label => 'Mật khẩu mới';

  @override
  String get account_new_password_hint => 'Nhập mật khẩu mới';

  @override
  String get account_confirm_new_password_label => 'Xác nhận mật khẩu mới';

  @override
  String get account_confirm_new_password_hint => 'Nhập lại mật khẩu mới';

  @override
  String get account_reset_password_success => 'Đổi mật khẩu thành công';

  @override
  String get account_language_vietnamese => 'Tiếng Việt';

  @override
  String get account_language_english => 'English';

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

  @override
  String get notification_sample_appointment_confirmed_title =>
      'Lịch hẹn đã được xác nhận';

  @override
  String get notification_sample_appointment_confirmed_desc =>
      'Lịch hẹn với BS. Nguyễn vào 28/03 lúc 10:00 đã được xác nhận.';

  @override
  String get notification_sample_clinic_message_title =>
      'Tin nhắn mới từ phòng khám';

  @override
  String get notification_sample_clinic_message_desc =>
      'Vui lòng hoàn thành bảng câu hỏi trước buổi khám.';

  @override
  String get notification_sample_prescription_ready_title =>
      'Đơn thuốc đã sẵn sàng';

  @override
  String get notification_sample_prescription_ready_desc =>
      'Đơn thuốc Amoxicillin của bạn đã sẵn sàng để nhận.';

  @override
  String get notification_sample_vaccine_schedule_title => 'Lịch tiêm vắc xin';

  @override
  String get notification_sample_vaccine_schedule_desc =>
      'Đã có thêm khung giờ tiêm trong tuần tới. Đặt ngay.';

  @override
  String get profile_section_general_title => 'Thông tin chung';

  @override
  String get profile_personal_info => 'Thông tin cá nhân';

  @override
  String get profile_health_info => 'Thông tin sức khỏe';

  @override
  String get profile_relatives_title => 'Hồ sơ người thân';

  @override
  String get profile_select_profile => 'Chọn hồ sơ';

  @override
  String get profile_add_profile_by_code => 'Thêm hồ sơ qua mã y tế';

  @override
  String get profile_add_profile_by_form => 'Thêm hồ sơ qua nhập thông tin';

  @override
  String get profile_add_profile_button => 'THÊM HỒ SƠ';

  @override
  String get profile_guest_label => 'Khách';

  @override
  String get profile_add_by_code_title => 'Thêm hồ sơ bằng mã';

  @override
  String get profile_add_by_code_tab_input => 'Nhập mã';

  @override
  String get profile_add_by_code_tab_scan => 'Quét mã';

  @override
  String get profile_add_by_code_instructions => 'Nhập mã hồ sơ để tìm kiếm';

  @override
  String get profile_add_by_code_hint => 'Nhập mã hồ sơ';

  @override
  String get profile_add_by_code_search_button => 'Tìm hồ sơ';

  @override
  String get profile_add_by_code_scanning_checking => 'Đang kiểm tra mã...';

  @override
  String get profile_add_by_code_scanning_instruction =>
      'Đưa mã vào giữa khung để quét tự động';

  @override
  String get profile_add_by_code_no_scanned => 'Chưa có mã nào được quét';

  @override
  String profile_add_by_code_last_scanned(Object code) {
    return 'Mã gần nhất: $code';
  }

  @override
  String profile_add_by_code_checked_snackbar(Object code) {
    return 'Đã kiểm tra mã hồ sơ: $code (mô phỏng).';
  }

  @override
  String get profile_add_form_title => 'Thêm hồ sơ';

  @override
  String get profile_name_hint => 'Họ và tên';

  @override
  String get profile_nickname_hint => 'Tên thân mật';

  @override
  String get profile_dob_hint => 'Sinh nhật';

  @override
  String get profile_phone_hint => 'Số điện thoại';

  @override
  String get profile_email_optional_hint => 'Email (không bắt buộc)';

  @override
  String get profile_gender_label => 'Giới tính';

  @override
  String get profile_relationship_label => 'Đây là hồ sơ của';

  @override
  String get profile_required => 'Bắt buộc';

  @override
  String get profile_phone_invalid => 'Số điện thoại không hợp lệ';

  @override
  String get profile_email_invalid => 'Email không hợp lệ';

  @override
  String get profile_finish_button => 'Hoàn tất';

  @override
  String get profile_avatar_take_photo => 'Chụp ảnh';

  @override
  String get profile_avatar_pick_from_gallery => 'Chọn từ thư viện';

  @override
  String get profile_avatar_pick_error =>
      'Không thể chọn ảnh. Vui lòng thử lại.';

  @override
  String get profile_add_success_toast => 'Đã thêm hồ sơ (mô phỏng).';

  @override
  String get profile_relationship_child => 'Con';

  @override
  String get profile_relationship_wife => 'Vợ';

  @override
  String get profile_relationship_husband => 'Chồng';

  @override
  String get profile_relationship_father => 'Bố';

  @override
  String get profile_relationship_mother => 'Mẹ';

  @override
  String get profile_relationship_other => 'Khác';

  @override
  String get profile_additional_title => 'Thông tin bổ sung';

  @override
  String get profile_identify_code_hint => 'Số CMT/Hộ chiếu';

  @override
  String get profile_job_hint => 'Nghề nghiệp';

  @override
  String get profile_address_hint => 'Địa chỉ';

  @override
  String get profile_nationality_hint => 'Quốc tịch';

  @override
  String get profile_nation_hint => 'Dân tộc';

  @override
  String get profile_additional_submitted_snackbar =>
      'Đã gửi thông tin (mô phỏng).';

  @override
  String get profile_basic_info_title => 'Thông tin cơ bản';

  @override
  String get profile_edit_button => 'Chỉnh sửa';

  @override
  String get profile_add_button => 'Thêm';

  @override
  String get profile_company_info_title => 'Thông tin công ty';

  @override
  String get profile_insurance_title => 'Thông tin bảo hiểm';

  @override
  String get profile_insurance_health => 'Bảo hiểm y tế';

  @override
  String get profile_insurance_private => 'Bảo hiểm tư nhân';

  @override
  String get profile_label_full_name => 'Họ và tên';

  @override
  String get profile_label_dob => 'Ngày sinh';

  @override
  String get profile_label_phone => 'Số điện thoại';

  @override
  String get profile_label_email => 'Email';

  @override
  String get profile_label_gender => 'Giới tính';

  @override
  String get profile_company_name => 'Tên doanh nghiệp';

  @override
  String get profile_company_tax_code => 'Mã số thuế';

  @override
  String get profile_company_address => 'Địa chỉ';

  @override
  String get profile_edit_basic_profile_title => 'Sửa thông tin cơ bản';

  @override
  String get profile_company_edit_title => 'Sửa thông tin công ty';

  @override
  String get profile_company_add_title => 'Thêm thông tin công ty';

  @override
  String get profile_company_name_hint => 'Tên doanh nghiệp';

  @override
  String get profile_company_tax_code_hint => 'Mã số thuế';

  @override
  String get profile_company_address_hint => 'Địa chỉ';

  @override
  String get profile_company_updated_snackbar =>
      'Đã cập nhật thông tin công ty (mô phỏng).';

  @override
  String get profile_company_added_snackbar =>
      'Đã thêm thông tin công ty (mô phỏng).';

  @override
  String get profile_insurance_number_hint => 'Số thẻ';

  @override
  String get profile_insurance_registration_location_hint => 'Nơi đăng ký';

  @override
  String get profile_insurance_expiration_date_hint => 'Ngày hết hạn';

  @override
  String get profile_insurance_updated_snackbar =>
      'Đã cập nhật thông tin bảo hiểm (mô phỏng).';

  @override
  String get profile_insurance_added_snackbar =>
      'Đã thêm thông tin bảo hiểm (mô phỏng).';

  @override
  String get profile_general_health_title => 'Thông tin tổng quát';

  @override
  String get profile_overview_title => 'Chỉ số sức khỏe cơ bản';

  @override
  String get profile_label_blood_type => 'Nhóm máu';

  @override
  String get profile_label_height => 'Chiều cao';

  @override
  String get profile_label_weight => 'Cân nặng';

  @override
  String get profile_blood_type_unknown => 'Chưa xác định';

  @override
  String get profile_decimal_input_hint =>
      'Bạn có thể nhập số lẻ, ví dụ 165.5 cm hoặc 52.3 kg.';

  @override
  String get profile_invalid_value => 'Không hợp lệ';

  @override
  String get profile_unit_cm => 'cm';

  @override
  String get profile_unit_kg => 'kg';

  @override
  String get profile_height_weight_title => 'Chiều cao và cân nặng';

  @override
  String get profile_height_weight_subtitle =>
      'Nhập các chỉ số cơ bản để hồ sơ sức khỏe đầy đủ hơn.';

  @override
  String get profile_general_health_saved_snackbar =>
      'Đã lưu thông tin tổng quát (mô phỏng).';

  @override
  String get profile_blood_type_subtitle =>
      'Bỏ qua bước chọn nhóm máu nếu bạn chưa có thông tin.';

  @override
  String get profile_life_style_title => 'Thói quen sinh hoạt';

  @override
  String get profile_allergy_information_title => 'Thông tin dị ứng';

  @override
  String get profile_life_style_nutrition => 'Dinh dưỡng';

  @override
  String get profile_life_style_drinking => 'Uống';

  @override
  String get profile_life_style_smoking => 'Thuốc lá';

  @override
  String get profile_life_style_sleep => 'Ngủ';

  @override
  String get profile_life_style_physical_activity => 'Hoạt động thể chất';

  @override
  String get profile_life_style_mental_health => 'Sức khoẻ tâm thần - tâm lý';

  @override
  String get profile_allergy_history => 'Tiền sử dị ứng';

  @override
  String get profile_allergy_food => 'Dị ứng thực phẩm';

  @override
  String get profile_allergy_medicine => 'Dị ứng thuốc';

  @override
  String get profile_allergy_skin => 'Dị ứng da';

  @override
  String get profile_allergy_environment => 'Dị ứng do môi trường';

  @override
  String get profile_allergy_other => 'Các dị ứng khác';

  @override
  String get profile_demo_registration_location_hpih =>
      'Bệnh viện Đa khoa Quốc tế Hải Phòng';

  @override
  String get profile_demo_registration_location_vinmec =>
      'Phòng khám Vinmec Hải Phòng';

  @override
  String get profile_demo_address_hp => '124 Nguyễn Đức Cảnh, Hải Phòng';

  @override
  String get profile_demo_full_name => 'Nguyễn Văn A';

  @override
  String get profile_demo_occupation_programmer => 'Lập trình viên';

  @override
  String get profile_demo_nationality_vietnam => 'Việt Nam';

  @override
  String get profile_demo_ethnicity_kinh => 'Kinh';

  @override
  String get dashboard_section_new_services => 'Dịch vụ mới';

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
  String get dashboard_question_screening_title => 'Câu hỏi sàng lọc sức khoẻ';

  @override
  String get dashboard_news_category_title => 'Danh mục tin tức';

  @override
  String get dashboard_important_notify_title => 'Thông báo quan trọng';

  @override
  String get dashboard_new_badge => 'Tin mới';

  @override
  String get dashboard_latest_news_title => 'Tin mới nhất';

  @override
  String get dashboard_important_notify_medicine_delivery =>
      'Mua thuốc tại nhà tiện lợi cùng tính năng mới trên ứng dụng của chúng tôi';

  @override
  String get dashboard_important_notify_online_visit =>
      'Khám bệnh trực tuyến cùng những y bác sĩ hàng đầu, không cần đến bệnh viện';

  @override
  String get dashboard_screening_reproductive_health =>
      'Sàng lọc sức khoẻ sinh sản';

  @override
  String get dashboard_screening_stroke => 'Sàng lọc đột quỵ';

  @override
  String get dashboard_news_medical_services => 'Dịch vụ y tế';

  @override
  String get dashboard_news_hospital_activities => 'Hoạt động bệnh viện';

  @override
  String get dashboard_news_health_information => 'Thông tin sức khoẻ';

  @override
  String get dashboard_news_vaccine_center => 'Trung tâm vắc xin';

  @override
  String get dashboard_post_foreign_body_title =>
      'Người đàn ông bị khối dị vật từ măng khô chiếm trọn dạ dày';

  @override
  String get dashboard_post_rare_blood_title =>
      'Cấp cứu xuyên đêm cứu thai phụ mang nhóm máu hiếm';

  @override
  String get dashboard_post_us_tourist_title =>
      'Cứu sống du khách Mỹ bị bóc tách động mạch chủ ngực';

  @override
  String get dashboard_post_practitioner_list_title =>
      'Danh sách người thực hành khám bệnh, chữa bệnh tại Bệnh viện Đa khoa Quốc tế Hải Phòng';

  @override
  String get dashboard_contact_title => 'Liên hệ';

  @override
  String get dashboard_contact_hotline_1 => 'Hotline 1';

  @override
  String get dashboard_contact_hotline_2 => 'Hotline 2';

  @override
  String get dashboard_contact_online_support => 'Hỗ trợ trực tuyến';

  @override
  String get dashboard_contact_map => 'Bản đồ';

  @override
  String get dashboard_contact_call_action => 'Gọi';

  @override
  String get dashboard_contact_open_action => 'Mở';

  @override
  String get dashboard_contact_directions_action => 'Chỉ đường';

  @override
  String get dashboard_contact_map_address =>
      '124 P. Nguyễn Đức Cảnh, Cát Dài, Lê Chân, Hải Phòng, Việt Nam';

  @override
  String get book_visit_title => 'Đặt lịch khám';

  @override
  String get book_visit_booker_info_title => 'Thông tin người đặt lịch';

  @override
  String get book_visit_booking_info_title => 'Thông tin đặt hẹn';

  @override
  String get book_visit_schedule_title => 'Lịch hẹn';

  @override
  String get book_visit_reason_title => 'Lý do khám';

  @override
  String get book_visit_select_visit_date => 'Chọn ngày khám';

  @override
  String get book_visit_select_session => 'Chọn buổi khám';

  @override
  String get book_visit_other_date => 'Ngày khác';

  @override
  String get book_visit_foreign_patient => 'Đặt hẹn cho người nước ngoài';

  @override
  String get book_visit_by_doctor => 'Đặt lịch theo bác sĩ';

  @override
  String get book_visit_by_specialty => 'Đặt lịch theo chuyên khoa';

  @override
  String get book_visit_by_symptom => 'Đặt lịch theo triệu chứng';

  @override
  String get book_visit_reason_hint =>
      'Nhập lý do khám, triệu chứng hoặc nhu cầu tư vấn';

  @override
  String get book_visit_submit_button => 'Đặt lịch';

  @override
  String get book_visit_success_toast => 'Đặt lịch thành công (mô phỏng).';

  @override
  String get book_visit_select_branch_title => 'Chọn chi nhánh';

  @override
  String get book_visit_branch_le_chan => 'Chi nhánh Lê Chân';

  @override
  String get book_visit_branch_vinh_bao => 'Chi nhánh Vĩnh Bảo';

  @override
  String get book_visit_branch_an_duong => 'Chi nhánh An Dương';

  @override
  String get book_visit_session_morning => 'Sáng';

  @override
  String get book_visit_session_afternoon => 'Chiều';

  @override
  String get book_visit_weekday_short_mon => 'T2';

  @override
  String get book_visit_weekday_short_tue => 'T3';

  @override
  String get book_visit_weekday_short_wed => 'T4';

  @override
  String get book_visit_weekday_short_thu => 'T5';

  @override
  String get book_visit_weekday_short_fri => 'T6';

  @override
  String get book_visit_weekday_short_sat => 'T7';

  @override
  String get book_visit_weekday_short_sun => 'CN';

  @override
  String get profile_gender_male => 'Nam';

  @override
  String get profile_gender_female => 'Nữ';
}
