import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class LoginFormWidget extends StatefulWidget {
  final VoidCallback onLogin;

  const LoginFormWidget({
    super.key,
    required this.onLogin,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _obscurePassword = true;
  final TextEditingController _emailController =
      TextEditingController(text: 'fikrihaikal568@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'test123');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label: EMAIL
        Text(
          'EMAIL',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.mutedGray,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 8.h),

        // Email TextField
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.sp,
            color: AppTheme.darkCharcoal,
          ),
          decoration: InputDecoration(
            hintText: 'Masukkan email',
            prefixIcon: Icon(
              Icons.mail_outline_rounded,
              color: AppTheme.mutedGray,
              size: 20.r,
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Label: PASSWORD
        Text(
          'PASSWORD',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.mutedGray,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 8.h),

        // Password TextField
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.sp,
            color: AppTheme.darkCharcoal,
          ),
          decoration: InputDecoration(
            hintText: 'Masukkan password',
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: AppTheme.mutedGray,
              size: 20.r,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: _obscurePassword
                    ? AppTheme.mutedGray
                    : AppTheme.primaryBlue,
                size: 20.r,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 24.h),

        // MASUK Button
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: widget.onLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'MASUK',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
