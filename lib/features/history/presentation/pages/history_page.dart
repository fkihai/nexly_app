import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';
import 'package:nexly_app/features/history/presentation/widgets/activity_log_card.dart';
import 'package:nexly_app/features/history/presentation/widgets/history_header_widget.dart';
import 'package:nexly_app/features/history/presentation/widgets/telemetry_chart_card.dart';
import 'package:nexly_app/features/history/presentation/widgets/time_range_filter_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
              const HistoryHeaderWidget(),
              const Divider(color: Color(0xFFF1F5F9), height: 1),
              SizedBox(height: 16.h),
              const TimeRangeFilterWidget(),
              SizedBox(height: 16.h),
              const TelemetryChartCard(),
              SizedBox(height: 20.h),
              const ActivityLogCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
