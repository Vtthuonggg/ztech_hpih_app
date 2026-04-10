import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ztech_hpih_app/core/theme/app_theme.dart';
import 'package:ztech_hpih_app/features/medicine/presentation/pages/create_medicine_page.dart';
import 'package:ztech_hpih_app/features/profile/presentation/pages/add_profile_by_code_page.dart';

class ListMedicinePage extends ConsumerStatefulWidget {
  static const path = '/list-medicine';
  const ListMedicinePage({super.key});

  @override
  ConsumerState<ListMedicinePage> createState() => _ListMedicinePageState();
}

class _ListMedicinePageState extends ConsumerState<ListMedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đơn thuốc')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                IconsaxPlusLinear.folder_open,
                size: 72,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'Không tìm thấy hồ sơ sức khoẻ để xem đơn thuốc',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(AddProfileByCodePage.path);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppTheme.primaryColor,
                    disabledForegroundColor: Colors.white,
                  ),
                  child: const Text('Kết nối hồ sơ và xem đơn thuốc'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.push(CreateMedicinePage.path);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: AppTheme.primaryColor),
                    foregroundColor: AppTheme.primaryColor,
                    disabledForegroundColor: AppTheme.primaryColor,
                  ),
                  child: const Text('Chụp ảnh đơn thuốc'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
