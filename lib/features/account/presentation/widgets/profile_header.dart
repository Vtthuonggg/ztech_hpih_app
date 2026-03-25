import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:healthcare_app/core/theme/app_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String? avatarUrl;
  final VoidCallback? onCameraPressed;

  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.phone,
    this.avatarUrl,
    this.onCameraPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Lớp nền chính với gradient + wave ──────────────────────────
        ClipPath(
          clipper: _WaveClipper(),
          child: Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primaryColor.withValues(alpha: 0.85),
                  AppTheme.primaryColor,
                  Color.lerp(AppTheme.primaryColor, Colors.teal.shade700, 0.4)!,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // ── Vòng tròn ánh sáng mờ phía trên trái ──
                Positioned(left: -40, top: -40, child: _GlowCircle(size: 160)),
                // ── Vòng tròn ánh sáng mờ phía dưới phải ──
                Positioned(
                  right: -20,
                  bottom: 20,
                  child: _GlowCircle(size: 120),
                ),

                // ── Lá trái to ──
                Positioned(
                  left: -12,
                  top: 30,
                  child: _LeafShape(size: 100, rotation: -0.35),
                ),
                // ── Lá trái nhỏ ──
                Positioned(
                  left: 28,
                  top: 90,
                  child: _LeafShape(size: 55, rotation: 0.25),
                ),
                // ── Lá trái mini ──
                Positioned(
                  left: 70,
                  top: 55,
                  child: _LeafShape(size: 35, rotation: -0.6),
                ),

                // ── Lá phải to ──
                Positioned(
                  right: -12,
                  top: 25,
                  child: _LeafShape(size: 90, rotation: 0.5, flip: true),
                ),
                // ── Lá phải nhỏ ──
                Positioned(
                  right: 28,
                  top: 95,
                  child: _LeafShape(size: 50, rotation: -0.3, flip: true),
                ),
                // ── Lá phải mini ──
                Positioned(
                  right: 75,
                  top: 50,
                  child: _LeafShape(size: 32, rotation: 0.8, flip: true),
                ),

                // ── Chấm trang trí ──
                Positioned(right: 55, top: 50, child: _Dot(size: 7)),
                Positioned(right: 35, top: 82, child: _Dot(size: 4)),
                Positioned(right: 90, top: 100, child: _Dot(size: 5)),
                Positioned(left: 110, top: 40, child: _Dot(size: 4)),
                Positioned(left: 85, top: 110, child: _Dot(size: 3)),

                // ── Đường cong trang trí phụ ──
                Positioned.fill(
                  child: CustomPaint(painter: _DecorLinePainter()),
                ),
              ],
            ),
          ),
        ),

        // ── Avatar + Tên + SĐT ─────────────────────────────────────────
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const SizedBox(height: 55),

              // ── Avatar với ring glow ──
              Stack(
                alignment: Alignment.center,
                children: [
                  // Ring ngoài mờ (glow effect)
                  Container(
                    width: 104,
                    height: 104,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.35),
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  // Avatar chính
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: avatarUrl != null
                          ? Image.network(
                              avatarUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => _defaultAvatar(),
                            )
                          : _defaultAvatar(),
                    ),
                  ),
                  // Nút camera
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: onCameraPressed,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.18),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 15,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ── Tên ──
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 0.3,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              // ── Số điện thoại với icon ──
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: 12,
                    color: Colors.white.withValues(alpha: 0.75),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.85),
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _defaultAvatar() => Container(
    color: Colors.grey[200],
    child: Icon(IconsaxPlusBold.user, size: 50, color: Colors.grey[400]),
  );
}

// ── Wave Clipper mượt hơn ──────────────────────────────────────────────────────
class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.cubicTo(
      size.width * 0.15,
      size.height - 8,
      size.width * 0.35,
      size.height + 6,
      size.width * 0.5,
      size.height - 14,
    );
    path.cubicTo(
      size.width * 0.65,
      size.height - 32,
      size.width * 0.82,
      size.height - 16,
      size.width,
      size.height - 6,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_WaveClipper old) => false;
}

// ── Đường cong trang trí phụ ──────────────────────────────────────────────────
class _DecorLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path1 = Path();
    path1.moveTo(0, size.height * 0.55);
    path1.cubicTo(
      size.width * 0.3,
      size.height * 0.35,
      size.width * 0.6,
      size.height * 0.7,
      size.width,
      size.height * 0.45,
    );
    canvas.drawPath(path1, paint);

    final path2 = Path();
    path2.moveTo(0, size.height * 0.75);
    path2.cubicTo(
      size.width * 0.25,
      size.height * 0.55,
      size.width * 0.7,
      size.height * 0.85,
      size.width,
      size.height * 0.65,
    );
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_DecorLinePainter old) => false;
}

// ── Glow Circle ───────────────────────────────────────────────────────────────
class _GlowCircle extends StatelessWidget {
  final double size;
  const _GlowCircle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.07),
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
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    final paintStroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.28)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(w * 0.5, 0);
    path.cubicTo(w * 1.15, h * 0.15, w * 1.15, h * 0.72, w * 0.5, h);
    path.cubicTo(-w * 0.15, h * 0.72, -w * 0.15, h * 0.15, w * 0.5, 0);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paintStroke);

    // Gân lá giữa
    final veinPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..strokeWidth = 0.9
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(w * 0.5, h * 0.06),
      Offset(w * 0.5, h * 0.94),
      veinPaint,
    );

    // Gân phụ
    for (int i = 1; i <= 5; i++) {
      final y = h * (0.15 + i * 0.13);
      final spread = 0.22 + i * 0.01;
      canvas.drawLine(
        Offset(w * 0.5, y),
        Offset(w * (0.5 + spread), y - h * 0.07),
        veinPaint,
      );
      canvas.drawLine(
        Offset(w * 0.5, y),
        Offset(w * (0.5 - spread), y - h * 0.07),
        veinPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_LeafPainter old) => false;
}

// ── Dot trang trí ─────────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final double size;
  const _Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.45),
        shape: BoxShape.circle,
      ),
    );
  }
}
