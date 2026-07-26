import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nexly_app/core/theme/app_theme.dart';
import 'package:nexly_app/features/account/presentation/widgets/connected_device_card.dart';
import 'package:nexly_app/features/account/presentation/widgets/logout_button_widget.dart';
import 'package:nexly_app/features/account/presentation/widgets/profile_header_widget.dart';
import 'package:nexly_app/features/account/presentation/widgets/setting_menu_item_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightIceBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              const Divider(color: Color(0xFFF1F5F9), height: 1),
              SizedBox(height: 16.h),
              SettingMenuItemWidget(
                icon: Icons.lock_outline_rounded,
                title: 'Ubah Password',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ubah Password ditekan'),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              ConnectedDeviceCard(
                onUnpair: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Unpair Node ditekan'),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              SettingMenuItemWidget(
                icon: Icons.info_outline_rounded,
                title: 'Tentang Aplikasi & Panduan IoT',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Panduan IoT ditekan'),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
              LogoutButtonWidget(
                onLogout: () {
                  context.go('/auth');
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
