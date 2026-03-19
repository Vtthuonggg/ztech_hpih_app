import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_basic_profile_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_company_info_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/edit_insurance_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/theme/app_theme.dart';
import 'additional_information_page.dart';

class DetailProfilePage extends ConsumerStatefulWidget {
  static const path = '/detail-profile';
  const DetailProfilePage({super.key});

  @override
  ConsumerState<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends ConsumerState<DetailProfilePage> {
  final Map<String, dynamic> _healthInsurance = {
    'id': 1,
    'code': 'HN-1234-5678-9012',
    'registration_location': 'Bệnh viện Đa khoa Quốc tế Hải Phòng',
  };

  final Map<String, dynamic> _privateInsurance = {
    'id': 2,
    'code': 'PVI-8899-XX12',
    'registration_location': 'Phòng khám Vinmec Hải Phòng',
    'expiration_date': '2027-12-31T00:00:00.000',
  };

  final Map<String, dynamic> _companyInfo = {
    'id': 3,
    'name': 'ZTech Healthcare',
    'tax_code': '0201234567',
    'address': '124 Nguyễn Đức Cảnh, Hải Phòng',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                MenuCard(
                  title: 'Thông tin cơ bản',
                  icon: IconsaxPlusLinear.profile_circle,
                  iconColor: AppTheme.primaryColor,
                  iconBg: AppTheme.primaryColor.withValues(alpha: 0.12),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(EditBasicProfilePage.path);
                    },
                    child: Text('Chỉnh sửa'),
                  ),
                  body: _buildBasicInfoBody(),
                ),
                MenuCard(
                  title: 'Thông tin bổ sung',
                  icon: IconsaxPlusLinear.document_text,
                  iconColor: Color(0xFF26A69A),
                  iconBg: Color(0xFFE8F7F5),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(AdditionalInformationPage.path);
                    },
                    child: Text('Thêm'),
                  ),
                  body: _buildAdditionalInfoBody(),
                ),
                MenuCard(
                  title: 'Thông tin bảo hiểm',
                  icon: IconsaxPlusLinear.shield_tick,
                  iconColor: Color(0xFFF59E0B),
                  iconBg: Color(0xFFFFF1DF),
                  body: _buildInsuranceBody(),
                ),
                MenuCard(
                  title: 'Thông tin công ty',
                  icon: IconsaxPlusLinear.building_4,
                  iconColor: Color(0xFF3B82F6),
                  iconBg: Color(0xFFEAF2FF),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(
                        EditCompanyInfoPage.path,
                        extra: {'edit_data': _companyInfo},
                      );
                    },
                    child: const Text('Chỉnh sửa'),
                  ),
                  body: _buildCompanyInfoBody(),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsuranceBody() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InsuranceRow(
              title: 'Bảo hiểm y tế',
              data: _healthInsurance,
              onTap: () {
                context.push(
                  EditInsurancePage.path,
                  extra: {
                    'is_private_insurance': false,
                    'edit_data': _healthInsurance,
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            _InsuranceRow(
              title: 'Bảo hiểm tư nhân',
              data: _privateInsurance,
              onTap: () {
                context.push(
                  EditInsurancePage.path,
                  extra: {
                    'is_private_insurance': true,
                    'edit_data': _privateInsurance,
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoBody() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InforRow(title: 'Họ và tên', value: 'Nguyễn Văn A'),
            const SizedBox(height: 12),
            InforRow(title: 'Ngày sinh', value: '01/01/1990'),
            const SizedBox(height: 12),
            InforRow(title: 'Số điện thoại', value: '0123456789'),
            const SizedBox(height: 12),
            InforRow(title: 'Email'),
            const SizedBox(height: 12),

            InforRow(title: 'Giới tính', value: 'Nam'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoBody() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InforRow(title: 'Số CMT/Hộ chiếu', value: '031203010143'),
            const SizedBox(height: 12),
            InforRow(title: 'Nghề nghiệp', value: 'Lập trình viên'),
            const SizedBox(height: 12),

            InforRow(title: 'Quốc tịch', value: 'Việt Nam'),
            const SizedBox(height: 12),
            InforRow(title: 'Dân tộc', value: 'Kinh'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfoBody() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InforRow(
              title: 'Tên doanh nghiệp',
              value: _companyInfo['name'] as String?,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: 'Mã số thuế',
              value: _companyInfo['tax_code'] as String?,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: 'Địa chỉ',
              value: _companyInfo['address'] as String?,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _InsuranceRow extends StatelessWidget {
  const _InsuranceRow({
    required this.title,
    required this.data,
    required this.onTap,
  });

  final String title;
  final Map<String, dynamic>? data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasData = data != null;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (hasData) ...[
                const SizedBox(height: 4),
                Text(
                  data?['code']?.toString() ?? '',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ],
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(hasData ? 'Chỉnh sửa' : 'Thêm'),
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.body,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final Widget? body;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            trailing: trailing,
            onTap: null,
          ),
          ?body,
        ],
      ),
    );
  }
}

class InforRow extends StatelessWidget {
  final String title;
  final String? value;
  const InforRow({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 14)),
        const SizedBox(height: 4),
        Text(
          value ?? '--',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
