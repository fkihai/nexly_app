import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';
import 'package:nexly_app/features/schedule/presentation/widgets/active_schedule_card.dart';
import 'package:nexly_app/features/schedule/presentation/widgets/add_schedule_card.dart';
import 'package:nexly_app/features/schedule/presentation/widgets/schedule_header_widget.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

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
              const ScheduleHeaderWidget(),
              const Divider(color: Color(0xFFF1F5F9), height: 1),
              SizedBox(height: 16.h),
              AddScheduleCard(
                onAddSchedule: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Jadwal baru berhasil ditambahkan!'),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              const ActiveScheduleCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
