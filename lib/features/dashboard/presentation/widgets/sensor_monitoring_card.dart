import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class SensorMonitoringCard extends StatelessWidget {
  const SensorMonitoringCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'PEMANTAUAN SENSOR',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.mutedGray,
              letterSpacing: 0.3,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              // Suhu Ruangan Card
              Expanded(
                child: _buildSensorItem(
                  title: 'Suhu Ruangan',
                  value: '27.5',
                  unit: '°C',
                  status: 'SUHU NORMAL',
                  icon: Icons.thermostat_rounded,
                  iconBgColor: const Color(0xFFFEF2F2),
                  iconColor: const Color(0xFFEF4444),
                ),
              ),
              SizedBox(width: 12.w),

              // Kelembapan Card
              Expanded(
                child: _buildSensorItem(
                  title: 'Kelembapan',
                  value: '62',
                  unit: '%',
                  status: 'Lembap Ideal',
                  icon: Icons.water_drop_outlined,
                  iconBgColor: const Color(0xFFEFF6FF),
                  iconColor: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSensorItem({
    required String title,
    required String value,
    required String unit,
    required String status,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkCharcoal,
                ),
              ),
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 18.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkCharcoal,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                unit,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkCharcoal,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            status,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.mutedGray,
            ),
          ),
        ],
      ),
    );
  }
}
