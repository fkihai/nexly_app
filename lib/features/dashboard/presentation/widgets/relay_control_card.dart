import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class RelayControlCard extends StatefulWidget {
  const RelayControlCard({super.key});

  @override
  State<RelayControlCard> createState() => _RelayControlCardState();
}

class _RelayControlCardState extends State<RelayControlCard> {
  bool _switchLampuState = false;
  bool _switchPompaState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'KONTROL RELAY & AKTUATOR',
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
          child: Column(
            children: [
              // Relay 1 Card
              _buildRelayItem(
                icon: Icons.power_settings_new_rounded,
                title: 'Relay 1',
                subtitle: 'Penerangan Ruang Tamu',
                value: _switchLampuState,
                onChanged: (val) {
                  setState(() {
                    _switchLampuState = val;
                  });
                },
              ),
              SizedBox(height: 10.h),

              // Relay 2 Card
              _buildRelayItem(
                icon: Icons.water_drop_outlined,
                title: 'Relay 2',
                subtitle: 'Kontrol Kipas Angin',
                value: _switchPompaState,
                onChanged: (val) {
                  setState(() {
                    _switchPompaState = val;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRelayItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: AppTheme.mutedGray,
              size: 20.r,
            ),
          ),
          SizedBox(width: 12.w),

          // Titles
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.sp,
                    color: AppTheme.mutedGray,
                  ),
                ),
              ],
            ),
          ),

          // Switch Toggle
          Switch(
            value: value,
            activeThumbColor: Colors.white,
            activeTrackColor: AppTheme.primaryBlue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE2E8F0),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
