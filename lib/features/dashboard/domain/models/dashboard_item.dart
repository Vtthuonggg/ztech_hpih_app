import 'package:flutter/material.dart';
import 'package:health_icons/health_icons.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../book_visit/presentation/pages/create_book_visit_page.dart';
import '../../../dashboard/presentation/pages/contact_page.dart';

class DashboardItem {
  const DashboardItem({
    required this.icon,
    required this.name,
    required this.routePath,
  });

  final IconData icon;
  final String name;
  final String routePath;

  bool get hasRoute => routePath.trim().isNotEmpty;
}

const List<DashboardItem> dashboardItems = [
  DashboardItem(
    icon: HealthIcons.iScheduleSchoolDateTimeFilled,
    name: 'Lịch hẹn',
    routePath: CreateBookVisitPage.path,
  ),
  DashboardItem(
    icon: IconsaxPlusLinear.call,
    name: 'Liên hệ',
    routePath: ContactPage.path,
  ),
  DashboardItem(
    icon: IconsaxPlusLinear.messages_2,
    name: 'Cộng đồng hỏi đáp',
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.syringeOutline,
    name: 'Sổ tiêm',
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.womanOutline,
    name: 'Cẩm nang làm mẹ',
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.healthVulnerabilityThroughSocialDeterminantsFilled,
    name: 'Tư vấn sức khoẻ từ xa',
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.blisterPillsOvalX14Outline,
    name: 'Đơn thuốc',
    routePath: '',
  ),
];
