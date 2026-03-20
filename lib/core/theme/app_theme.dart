import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(
    0xFF234F9B,
  ); // 🔵 Màu chính (brand): AppBar, nút chính, icon & text quan trọng

  static const Color secondaryColor = Color(
    0xFF5B8DEF,
  ); // 🔷 Màu phụ: tab selected, border focus, progress, background nhẹ cho card

  static const Color backgroundColor = Color(
    0xFFF4F7FF,
  ); // ⚪ Background tổng: Scaffold, nền màn hình, giúp UI sáng và thoáng

  static const Color accentColor = Color(
    0xFFFFC857,
  ); // 🟠 Màu nhấn (CTA): nút "Đặt lịch", "Thanh toán", FAB, badge (dùng ít để nổi bật)

  static const Color successColor = Color(
    0xFF2EC4B6,
  ); // 🟢 Thành công: thông báo success, icon check, trạng thái hoàn tất

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      primary: primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIconColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        elevation: 8,
        shadowColor: AppTheme.secondaryColor.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,

        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(Size.zero),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.pressed)) {
            return secondaryColor.withOpacity(0.5);
          }
          return secondaryColor;
        }),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: secondaryColor,
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      contentTextStyle: const TextStyle(fontSize: 16, color: Colors.black54),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevation: WidgetStateProperty.all(8),
        shadowColor: WidgetStateProperty.all(
          AppTheme.secondaryColor.withValues(alpha: 0.3),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      primary: primaryColor,
    ),
  );
}
