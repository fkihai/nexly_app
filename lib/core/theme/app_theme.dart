import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1A73E8);
  static const Color secondaryBlue = Color(0xFF4285F4);
  static const Color lightIceBlue = Color(0xFFF8FAFF);
  static const Color darkCharcoal = Color(0xFF202124);
  static const Color mutedGray = Color(0xFF5F6368);
  static const Color alertRed = Color(0xFFD93025);

  static const Color cardWhite = Colors.white;
  static const Color borderLine = Color(0xFFF1F5F9); // slate-100
  static const Color greenSuccess = Color(0xFF137333); // Google Green
  static const Color warningAmber = Color(0xFFF29900); // Google Amber

  // Aliases for compatibility with main.dart
  static const Color successGreen = greenSuccess;
  static const Color dangerRed = alertRed;
  static const Color textDark = darkCharcoal;
  static const Color textMuted = mutedGray;

  /// **Light Theme**
  /// Mimics the main screen layout of your web-app emulator.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: lightIceBlue,

      // Unified Color Scheme
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: secondaryBlue,
        surface: cardWhite,
        error: alertRed,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkCharcoal,
        onError: Colors.white,
        outline: borderLine,
      ),

      // Typography (Inter & JetBrains Mono for Monospaced)
      textTheme: TextTheme(
        // For Large Titles / Display
        displayLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: darkCharcoal,
          letterSpacing: -0.5,
        ),
        // For Sub-Headers / Card Titles
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: darkCharcoal,
          letterSpacing: 0.1,
        ),
        // For Regular Text / Main Content
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: darkCharcoal,
        ),
        // Secondary Text / Muted Gray Description
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: mutedGray,
        ),
        // Small Labels / Categories (Uppercase styling configured in widgets)
        labelSmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
          color: primaryBlue,
          letterSpacing: 0.5,
        ),
      ),

      // Input Field Design (TextField / Password field)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightIceBlue,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        hintStyle: TextStyle(
            fontFamily: 'Inter', fontSize: 12.sp, color: mutedGray),
        labelStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.sp,
            color: darkCharcoal,
            fontWeight: FontWeight.w600),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)), // slate-200
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: primaryBlue, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: alertRed),
        ),
      ),

      // Primary Button Design (ElevatedButton)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Card Design (Card Theme)
      cardTheme: CardTheme(
        color: cardWhite,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: const BorderSide(color: borderLine),
        ),
      ),

      // Bottom Navigation Bar Design
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardWhite,
        selectedItemColor: primaryBlue,
        unselectedItemColor: mutedGray,
        selectedLabelStyle:
            TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Switch Design (Toggle Switch Relay)
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) return Colors.white;
          return Colors.white;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) return secondaryBlue;
          return const Color(0xFFE2E8F0);
        }),
      ),
    );
  }

  /// **Monospaced Font Helper (JetBrains Mono)**
  /// Use this helper for temperature, humidity, log time, or sensor data.
  static TextStyle monoStyle({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    Color color = darkCharcoal,
  }) {
    return TextStyle(
      fontFamily: 'JetBrainsMono',
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
