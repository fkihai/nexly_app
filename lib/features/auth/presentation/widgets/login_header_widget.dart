import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        // App Logo Badge Container
        Container(
          width: 72.r,
          height: 72.r,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF), // Light blue background
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Icon(
            Icons.home_outlined,
            color: AppTheme.primaryBlue,
            size: 36.r,
          ),
        ),
        SizedBox(height: 24.h),

        // Welcome Headline
        Text(
          'Selamat Datang',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkCharcoal,
          ),
        ),
        SizedBox(height: 6.h),

        // Subtitle
        Text(
          'Masuk untuk memonitor perangkat Anda',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: AppTheme.mutedGray,
          ),
        ),
      ],
    );
  }
}
