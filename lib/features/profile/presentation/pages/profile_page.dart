import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_app/core/localization/l10n_extension.dart';
import 'package:healthcare_app/core/widgets/select_option_bottom_sheet.dart';
import 'package:healthcare_app/features/auth/domain/models/user.dart';
import 'package:healthcare_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:healthcare_app/features/auth/presentation/providers/auth_state.dart';
import 'package:healthcare_app/features/profile/presentation/pages/add_profile_by_code_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/add_profile_form_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/detail_profile_page.dart';
import 'package:healthcare_app/features/profile/presentation/pages/health_infomation_page.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/theme/app_theme.dart';

const double _kAvatarOverlap = 28.0;
const double _kAvatarRadius = 40.0;

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);

    final AuthState authState = ref.watch(authProvider);
    final user = authState.maybeWhen(
      authenticated: (u) => u,
      orElse: () => null,
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _ProfileHeader(user),
                Positioned(
                  bottom: -_kAvatarOverlap,
                  left: 16,
                  child: _Avatar(radius: _kAvatarRadius, onCameraTap: _noop),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                _kAvatarOverlap + 8,
                16,
                0,
              ),
              child: _ProfileBody(user: user),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Profile Header (nền + lá + tên) ──────────────────────────────────────────
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader(this.user);

  final User? user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.85),
            AppTheme.primaryColor.withValues(alpha: 0.5),
            const Color(0xFF56CCF2).withValues(alpha: 0.12),
          ],
          stops: const [0.0, 0.5, 0.85, 1.0],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 80,
          child: Stack(
            children: [
              const Positioned(
                left: -80,
                top: 0,
                child: _SoftCircle(size: 180, opacity: 0.10),
              ),
              const Positioned(
                right: -60,
                top: 40,
                child: _SoftCircle(size: 140, opacity: 0.08),
              ),

              // ── Lá trang trí ──
              const Positioned(
                left: -12,
                top: 8,
                child: _LeafShape(size: 90, rotation: -0.35),
              ),
              const Positioned(
                left: 25,
                top: 60,
                child: _LeafShape(size: 50, rotation: 0.25),
              ),
              const Positioned(
                left: 65,
                top: 22,
                child: _LeafShape(size: 32, rotation: -0.6),
              ),
              const Positioned(
                right: -12,
                top: 5,
                child: _LeafShape(size: 80, rotation: 0.5, flip: true),
              ),
              const Positioned(
                right: 25,
                top: 62,
                child: _LeafShape(size: 46, rotation: -0.3, flip: true),
              ),
              const Positioned(
                right: 70,
                top: 20,
                child: _LeafShape(size: 30, rotation: 0.8, flip: true),
              ),

              // ── Chấm trang trí ──
              const Positioned(right: 52, top: 28, child: _Dot(size: 6)),
              const Positioned(right: 36, top: 58, child: _Dot(size: 4)),
              const Positioned(right: 86, top: 72, child: _Dot(size: 3)),
              const Positioned(left: 106, top: 18, child: _Dot(size: 4)),
              const Positioned(left: 80, top: 76, child: _Dot(size: 3)),

              const Positioned.fill(
                child: CustomPaint(painter: _DecorLinePainter()),
              ),

              Positioned(
                left: (_kAvatarRadius * 2 + 10) + 28,
                right: 16,
                bottom: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user?.fullName ?? l10n.profile_guest_label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.2,
                        shadows: const [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                    // if (user?.phone != null) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 11,
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '0865202584',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.85),
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                    // ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Profile Body ──────────────────────────────────────────────────────────────
class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        _SectionTitle(title: l10n.profile_section_general_title),
        const SizedBox(height: 8),
        _MenuCard(
          children: [
            _MenuTile(
              icon: IconsaxPlusLinear.user,
              title: l10n.profile_personal_info,
              onTap: () => context.push(DetailProfilePage.path),
            ),
            _MenuTile(
              icon: IconsaxPlusLinear.heart,
              title: l10n.profile_health_info,
              onTap: () => context.push(HealthInfomationPage.path),
            ),
          ],
        ),
        const SizedBox(height: 22),
        _SectionTitle(title: l10n.profile_relatives_title),
        const SizedBox(height: 14),
        _RelativeEmptyCard(
          onAdd: () async {
            await SelectOptionBottomSheet.show(
              context,
              title: l10n.profile_select_profile,
              options: [
                SelectOptionBottomSheetOption(
                  title: l10n.profile_add_profile_by_code,
                  icon: IconsaxPlusLinear.barcode,
                  iconColor: Colors.blue,
                  onTap: (ctx) async {
                    context.push(AddProfileByCodePage.path);
                    return;
                  },
                ),
                SelectOptionBottomSheetOption(
                  title: l10n.profile_add_profile_by_form,
                  iconColor: Colors.green,
                  icon: IconsaxPlusLinear.document_text_1,
                  onTap: (ctx) async {
                    context.push(AddProfileFormPage.path);
                    return;
                  },
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 36),
        SizedBox(height: (kBottomNavigationBarHeight + 30).h),
      ],
    );
  }
}

// ── Soft Circle ───────────────────────────────────────────────────────────────
class _SoftCircle extends StatelessWidget {
  const _SoftCircle({required this.size, required this.opacity});
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: opacity),
      ),
    );
  }
}

void _noop() {}

// ── Avatar ────────────────────────────────────────────────────────────────────
class _Avatar extends StatelessWidget {
  const _Avatar({required this.radius, required this.onCameraTap});
  final double radius;
  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    return SizedBox(
      width: size + 10,
      height: size + 10,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Container(
              width: size + 10,
              height: size + 10,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(5),
              child: ClipOval(
                child: Container(
                  color: Colors.grey[200],
                  child: Icon(
                    IconsaxPlusBold.user,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 2,
            bottom: 2,
            child: Material(
              color: Colors.white,
              shape: const CircleBorder(),
              elevation: 6,
              shadowColor: Colors.black.withValues(alpha: 0.18),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onCameraTap,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    IconsaxPlusLinear.camera,
                    size: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Title ─────────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.grey[900],
      ),
    );
  }
}

// ── Menu Card ─────────────────────────────────────────────────────────────────
class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Column(children: children),
      ),
    );
  }
}

// ── Menu Tile ─────────────────────────────────────────────────────────────────
class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      leading: Icon(icon, color: AppTheme.primaryColor, size: 18),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.grey[900],
        ),
      ),
      trailing: Icon(IconsaxPlusLinear.arrow_right_3, color: Colors.grey[500]),
    );
  }
}

// ── Relative Empty Card ───────────────────────────────────────────────────────
class _RelativeEmptyCard extends StatelessWidget {
  const _RelativeEmptyCard({required this.onAdd});
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 92,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              IconsaxPlusLinear.folder_add,
              size: 48,
              color: AppTheme.primaryColor.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: 170,
            child: ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.90),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: Text(context.l10n.profile_add_profile_button),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Leaf Shape ────────────────────────────────────────────────────────────────
class _LeafShape extends StatelessWidget {
  final double size;
  final double rotation;
  final bool flip;
  const _LeafShape({required this.size, this.rotation = 0, this.flip = false});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateZ(rotation)
        ..scale(flip ? -1.0 : 1.0, 1.0),
      alignment: Alignment.center,
      child: CustomPaint(size: Size(size, size * 1.5), painter: _LeafPainter()),
    );
  }
}

class _LeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final fill = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final vein = Paint()
      ..color = Colors.white.withValues(alpha: 0.20)
      ..strokeWidth = 0.9
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(w * 0.5, 0)
      ..cubicTo(w * 1.15, h * 0.15, w * 1.15, h * 0.72, w * 0.5, h)
      ..cubicTo(-w * 0.15, h * 0.72, -w * 0.15, h * 0.15, w * 0.5, 0)
      ..close();
    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);

    canvas.drawLine(Offset(w * 0.5, h * 0.06), Offset(w * 0.5, h * 0.94), vein);
    for (int i = 1; i <= 5; i++) {
      final y = h * (0.15 + i * 0.13);
      final s = 0.22 + i * 0.01;
      canvas.drawLine(
        Offset(w * 0.5, y),
        Offset(w * (0.5 + s), y - h * 0.07),
        vein,
      );
      canvas.drawLine(
        Offset(w * 0.5, y),
        Offset(w * (0.5 - s), y - h * 0.07),
        vein,
      );
    }
  }

  @override
  bool shouldRepaint(_LeafPainter old) => false;
}

// ── Dot ───────────────────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final double size;
  const _Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.40),
        shape: BoxShape.circle,
      ),
    );
  }
}

// ── Decor Line Painter ────────────────────────────────────────────────────────
class _DecorLinePainter extends CustomPainter {
  const _DecorLinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.55)
        ..cubicTo(
          size.width * 0.3,
          size.height * 0.35,
          size.width * 0.6,
          size.height * 0.7,
          size.width,
          size.height * 0.45,
        ),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * 0.78)
        ..cubicTo(
          size.width * 0.25,
          size.height * 0.58,
          size.width * 0.7,
          size.height * 0.88,
          size.width,
          size.height * 0.68,
        ),
      paint,
    );
  }

  @override
  bool shouldRepaint(_DecorLinePainter old) => false;
}
