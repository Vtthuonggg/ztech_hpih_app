import 'package:flutter/material.dart';

Future<String?> showSelectBranchSheet(BuildContext context) {
  return showModalBottomSheet<String?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.22),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
    ),
    builder: (ctx) {
      final height = MediaQuery.of(ctx).size.height * 0.8;
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: Container(
          color: Colors.white,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 10,
              bottom: 16 + MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Chọn chi nhánh',
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 6),
                    itemCount: _BookingBranch.values.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final branch = _BookingBranch.values[index];
                      return Material(
                        color: Colors.white,
                        elevation: 6,
                        shadowColor: Colors.black.withValues(alpha: 0.04),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Color(0xFFE6E9EE)),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => Navigator.of(ctx).pop(branch.apiValue),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    branch.label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF101828),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF98A2B3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

enum _BookingBranch {
  leChan('Chi nhánh Lê Chân', 'le_chan'),
  vinhBao('Chi nhánh Vĩnh Bảo', 'vinh_bao'),
  anDuong('Chi nhánh An Dương', 'an_duong');

  const _BookingBranch(this.label, this.apiValue);
  final String label;
  final String apiValue;
}
