import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/edit_basic_profile_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/edit_company_info_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/edit_insurance_page.dart';
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
  Map<String, dynamic> _healthInsurance(BuildContext context) => {
    'id': 1,
    'code': 'HN-1234-5678-9012',
    'registration_location': context.l10n.profile_demo_registration_location_hpih,
  };

  Map<String, dynamic> _privateInsurance(BuildContext context) => {
    'id': 2,
    'code': 'PVI-8899-XX12',
    'registration_location':
        context.l10n.profile_demo_registration_location_vinmec,
    'expiration_date': '2027-12-31T00:00:00.000',
  };

  Map<String, dynamic> _companyInfo(BuildContext context) => {
    'id': 3,
    'name': 'ZTech Healthcare',
    'tax_code': '0201234567',
    'address': context.l10n.profile_demo_address_hp,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: AppBar(title: Text(l10n.profile_personal_info)),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                MenuCard(
                  title: l10n.profile_basic_info_title,
                  icon: IconsaxPlusLinear.profile_circle,
                  iconColor: AppTheme.primaryColor,
                  iconBg: AppTheme.primaryColor.withValues(alpha: 0.12),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(EditBasicProfilePage.path);
                    },
                    child: Text(l10n.profile_edit_button),
                  ),
                  body: _buildBasicInfoBody(),
                ),
                MenuCard(
                  title: l10n.profile_additional_title,
                  icon: IconsaxPlusLinear.document_text,
                  iconColor: Color(0xFF26A69A),
                  iconBg: Color(0xFFE8F7F5),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(AdditionalInformationPage.path);
                    },
                    child: Text(l10n.profile_add_button),
                  ),
                  body: _buildAdditionalInfoBody(),
                ),
                MenuCard(
                  title: l10n.profile_insurance_title,
                  icon: IconsaxPlusLinear.shield_tick,
                  iconColor: Color(0xFFF59E0B),
                  iconBg: Color(0xFFFFF1DF),
                  body: _buildInsuranceBody(),
                ),
                MenuCard(
                  title: l10n.profile_company_info_title,
                  icon: IconsaxPlusLinear.building_4,
                  iconColor: Color(0xFF3B82F6),
                  iconBg: Color(0xFFEAF2FF),
                  trailing: TextButton(
                    onPressed: () {
                      context.push(
                        EditCompanyInfoPage.path,
                        extra: {'edit_data': _companyInfo(context)},
                      );
                    },
                    child: Text(l10n.profile_edit_button),
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
    final l10n = context.l10n;
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
              title: l10n.profile_insurance_health,
              data: _healthInsurance(context),
              onTap: () {
                context.push(
                  EditInsurancePage.path,
                  extra: {
                    'is_private_insurance': false,
                    'edit_data': _healthInsurance(context),
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            _InsuranceRow(
              title: l10n.profile_insurance_private,
              data: _privateInsurance(context),
              onTap: () {
                context.push(
                  EditInsurancePage.path,
                  extra: {
                    'is_private_insurance': true,
                    'edit_data': _privateInsurance(context),
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
    final l10n = context.l10n;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InforRow(
              title: l10n.profile_label_full_name,
              value: l10n.profile_demo_full_name,
            ),
            const SizedBox(height: 12),
            InforRow(title: l10n.profile_label_dob, value: '01/01/1990'),
            const SizedBox(height: 12),
            InforRow(title: l10n.profile_label_phone, value: '0123456789'),
            const SizedBox(height: 12),
            InforRow(title: l10n.profile_label_email),
            const SizedBox(height: 12),

            InforRow(
              title: l10n.profile_label_gender,
              value: l10n.profile_gender_male,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoBody() {
    final l10n = context.l10n;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InforRow(
              title: l10n.profile_identify_code_hint,
              value: '031203010143',
            ),
            const SizedBox(height: 12),
            InforRow(
              title: l10n.profile_job_hint,
              value: l10n.profile_demo_occupation_programmer,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: l10n.profile_nationality_hint,
              value: l10n.profile_demo_nationality_vietnam,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: l10n.profile_nation_hint,
              value: l10n.profile_demo_ethnicity_kinh,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfoBody() {
    final l10n = context.l10n;
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
              title: l10n.profile_company_name,
              value: _companyInfo(context)['name'] as String?,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: l10n.profile_company_tax_code,
              value: _companyInfo(context)['tax_code'] as String?,
            ),
            const SizedBox(height: 12),
            InforRow(
              title: l10n.profile_company_address,
              value: _companyInfo(context)['address'] as String?,
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
    final l10n = context.l10n;
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
          child: Text(
            hasData ? l10n.profile_edit_button : l10n.profile_add_button,
          ),
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
