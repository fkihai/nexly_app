import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class LoginFooterWidget extends StatelessWidget {
  final VoidCallback onForgotPassword;

  const LoginFooterWidget({
    super.key,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onForgotPassword,
        style: TextButton.styleFrom(
          foregroundColor: AppTheme.primaryBlue,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
        child: Text(
          'Lupa Password?',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlue,
          ),
        ),
      ),
    );
  }
}
