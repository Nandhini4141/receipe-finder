import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Light theme colors
  static const Color primaryLight = Color(0xFF2D5016);
  static const Color primaryVariantLight = Color(0xFF1F3A0F);
  static const Color secondaryLight = Color(0xFF8B4513);
  static const Color secondaryVariantLight = Color(0xFF6B3410);
  static const Color backgroundLight = Color(0xFFFEFEFE);
  static const Color surfaceLight = Color(0xFFF8F6F3);
  static const Color textPrimaryLight = Color(0xFF2C3E50);
  static const Color textSecondaryLight = Color(0xFF7F8C8D);
  static const Color shadowLight = Color(0x0A000000);
  static const Color cardLight = Color(0xFFF8F6F3);

  // Dark theme colors
  static const Color primaryDark = Color(0xFF4A7C2A);
  static const Color primaryVariantDark = Color(0xFF2D5016);
  static const Color secondaryDark = Color(0xFFB8651A);
  static const Color secondaryVariantDark = Color(0xFF8B4513);
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color surfaceDark = Color(0xFF2D2D2D);
  static const Color textPrimaryDark = Color(0xFFFEFEFE);
  static const Color textSecondaryDark = Color(0xFFBDC3C7);
  static const Color shadowDark = Color(0x0AFFFFFF);
  static const Color cardDark = Color(0xFF2D2D2D);

  /// Light theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryLight,
    scaffoldBackgroundColor: backgroundLight,
    cardColor: cardLight,
    cardTheme: CardThemeData(
      color: cardLight,
      elevation: 1.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: primaryLight,
      unselectedLabelColor: textSecondaryLight,
      indicatorColor: primaryLight,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      foregroundColor: textPrimaryLight,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimaryLight),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLight,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryLight, width: 2),
      ),
    ),
    textTheme: _buildTextTheme(isLight: true),
  );

  /// Dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    scaffoldBackgroundColor: backgroundDark,
    cardColor: cardDark,
    cardTheme: CardThemeData(
      color: cardDark,
      elevation: 1.0,
      shadowColor: shadowDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: primaryDark,
      unselectedLabelColor: textSecondaryDark,
      indicatorColor: primaryDark,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      foregroundColor: textPrimaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimaryDark),
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimaryDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryDark, width: 2),
      ),
    ),
    textTheme: _buildTextTheme(isLight: false),
  );

  static TextTheme _buildTextTheme({required bool isLight}) {
    final color = isLight ? textPrimaryLight : textPrimaryDark;
    return TextTheme(
      bodyLarge: GoogleFonts.inter(color: color, fontSize: 16),
      bodyMedium: GoogleFonts.inter(color: color, fontSize: 14),
      bodySmall: GoogleFonts.inter(color: isLight ? textSecondaryLight : textSecondaryDark, fontSize: 12),
    );
  }
}
