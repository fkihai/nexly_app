import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nexly_app/features/auth/presentation/widgets/login_footer_widget.dart';
import 'package:nexly_app/features/auth/presentation/widgets/login_form_widget.dart';
import 'package:nexly_app/features/auth/presentation/widgets/login_header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginHeaderWidget(),
              SizedBox(height: 40.h),
              LoginFormWidget(
                onLogin: () => context.go('/dashboard'),
              ),
              SizedBox(height: 48.h),
              LoginFooterWidget(
                onForgotPassword: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur Lupa Password dalam pengembangan'),
                    ),
                  );
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
