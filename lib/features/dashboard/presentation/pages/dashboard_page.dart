import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';
import 'package:nexly_app/features/dashboard/presentation/widgets/dashboard_app_bar_widget.dart';
import 'package:nexly_app/features/dashboard/presentation/widgets/node_status_card.dart';
import 'package:nexly_app/features/dashboard/presentation/widgets/relay_control_card.dart';
import 'package:nexly_app/features/dashboard/presentation/widgets/sensor_monitoring_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightIceBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardAppBarWidget(),
              const Divider(color: Color(0xFFF1F5F9), height: 1),
              SizedBox(height: 16.h),
              const SensorMonitoringCard(),
              SizedBox(height: 20.h),
              const RelayControlCard(),
              SizedBox(height: 20.h),
              const NodeStatusCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
