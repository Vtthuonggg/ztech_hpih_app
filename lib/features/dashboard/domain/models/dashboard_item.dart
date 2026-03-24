import 'package:flutter/material.dart';
import 'package:health_icons/health_icons.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../dashboard/presentation/pages/contact_page.dart';

enum DashboardItemType {
  appointment,
  contact,
  community,
  vaccinationRecord,
  motherhoodHandbook,
  remoteHealthConsultation,
  prescription,
}

class DashboardItem {
  const DashboardItem({
    required this.icon,
    required this.type,
    required this.routePath,
  });

  final IconData icon;
  final DashboardItemType type;
  final String routePath;

  bool get hasRoute => routePath.trim().isNotEmpty;
}

const List<DashboardItem> dashboardItems = [
  DashboardItem(
    icon: HealthIcons.iScheduleSchoolDateTimeFilled,
    type: DashboardItemType.appointment,
    routePath: '',
  ),
  DashboardItem(
    icon: IconsaxPlusLinear.call,
    type: DashboardItemType.contact,
    routePath: ContactPage.path,
  ),
  DashboardItem(
    icon: IconsaxPlusLinear.messages_2,
    type: DashboardItemType.community,
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.syringeOutline,
    type: DashboardItemType.vaccinationRecord,
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.womanOutline,
    type: DashboardItemType.motherhoodHandbook,
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.healthVulnerabilityThroughSocialDeterminantsFilled,
    type: DashboardItemType.remoteHealthConsultation,
    routePath: '',
  ),
  DashboardItem(
    icon: HealthIcons.blisterPillsOvalX14Outline,
    type: DashboardItemType.prescription,
    routePath: '',
  ),
];
