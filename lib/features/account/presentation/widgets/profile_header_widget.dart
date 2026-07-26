import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        // Circle Initials Avatar
        Container(
          width: 72.r,
          height: 72.r,
          decoration: const BoxDecoration(
            color: Color(0xFFEFF6FF),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            'FI',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlue,
            ),
          ),
        ),
        SizedBox(height: 12.h),

        // User Name
        Text(
          'Fikri Haikal',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkCharcoal,
          ),
        ),
        SizedBox(height: 4.h),

        // User Email
        Text(
          'fikrihaikal568@gmail.com',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 11.sp,
            color: AppTheme.mutedGray,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
