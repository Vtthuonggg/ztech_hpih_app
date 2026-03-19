import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:health_icons/health_icons.dart';
import 'package:healthcare_app/features/profile/domain/models/allergy_infomation_item.dart';
import 'package:healthcare_app/features/profile/presentation/pages/detail_profile_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/general_health_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../domain/models/life_style_habit_item.dart';

class HealthInfomationPage extends ConsumerStatefulWidget {
  static const path = '/health-infomation';
  const HealthInfomationPage({super.key});

  @override
  ConsumerState<HealthInfomationPage> createState() =>
      _HealthInfomationPageState();
}

class _HealthInfomationPageState extends ConsumerState<HealthInfomationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(title: const Text('Thông tin sức khỏe')),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                MenuCard(
                  title: 'Thông tin tổng quát',
                  icon: IconsaxPlusLinear.heart,
                  iconColor: Colors.red,
                  iconBg: Colors.red.withValues(alpha: 0.1),
                  trailing: TextButton(
                    child: const Text('Thêm'),
                    onPressed: () {
                      context.push(GeneralHealthPage.path);
                    },
                  ),
                  body: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InforRow(title: 'Nhóm máu', value: 'Chưa xác định'),
                          const SizedBox(height: 12),
                          InforRow(title: 'Cân nặng', value: '50kg'),
                          const SizedBox(height: 12),
                          InforRow(title: 'Chiều cao', value: '170cm'),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
                MenuCard(
                  title: 'Thói quen sinh hoạt',
                  icon: IconsaxPlusLinear.timer_pause,
                  iconColor: Colors.blue,
                  iconBg: Colors.blue.withValues(alpha: 0.1),
                  body: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: lifeStyleHabitItems
                            .map(
                              (e) => _MenuItem(
                                title: e.title,
                                routePath: e.routePath,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                MenuCard(
                  title: 'Thông tin dị ứng',
                  icon: HealthIcons.riskAnalysisOutline,
                  iconColor: Colors.orange,
                  iconBg: Colors.orange.withValues(alpha: 0.1),
                  body: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: allergyInfomationItems
                            .map(
                              (e) => _MenuItem(
                                title: e.title,
                                routePath: e.routePath,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  String title;
  String routePath;
  _MenuItem({required this.title, required this.routePath});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(routePath);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.grey[900],
        ),
      ),
      trailing: Icon(IconsaxPlusLinear.arrow_right_3, color: Colors.grey[500]),
    );
  }
}
