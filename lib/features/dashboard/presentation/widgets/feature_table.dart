import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import 'package:healthcare_app/core/theme/app_theme.dart';
import 'package:healthcare_app/features/dashboard/domain/models/dashboard_item.dart';

class FeatureTable extends StatelessWidget {
  const FeatureTable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;

        final isTablet = screenWidth >= 600;

        final crossAxisCount = isTablet ? 7 : 4;

        final iconSize = isTablet ? 48.0 : 45.0;
        final iconInnerSize = isTablet ? 22.0 : 22.0;
        final fontSize = isTablet ? 11.0 : 10.5.sp;
        final l10n = context.l10n;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 16,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 10,
              childAspectRatio: isTablet ? 1.4 : 0.9,
            ),
            itemCount: dashboardItems.length,
            itemBuilder: (context, index) {
              final feature = dashboardItems[index];
              String label;
              switch (feature.type) {
                case DashboardItemType.appointment:
                  label = l10n.dashboard_appointments;
                  break;
                case DashboardItemType.contact:
                  label = l10n.dashboard_contact;
                  break;
                case DashboardItemType.community:
                  label = l10n.dashboard_community_qna;
                  break;
                case DashboardItemType.vaccinationRecord:
                  label = l10n.dashboard_vaccination_record;
                  break;
                case DashboardItemType.motherhoodHandbook:
                  label = l10n.dashboard_parenting_guide;
                  break;
                case DashboardItemType.remoteHealthConsultation:
                  label = l10n.dashboard_teleconsultation;
                  break;
                case DashboardItemType.prescription:
                  label = l10n.dashboard_prescriptions;
                  break;
              }
              return GestureDetector(
                onTap: feature.hasRoute
                    ? () => context.push(feature.routePath)
                    : null,
                child: Column(
                  children: [
                    Container(
                      width: iconSize,
                      height: iconSize,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        feature.icon,
                        size: iconInnerSize,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: const Color(0xff262A37),
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
