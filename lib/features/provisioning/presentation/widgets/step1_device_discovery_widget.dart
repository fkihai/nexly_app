import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class Step1DeviceDiscoveryWidget extends StatelessWidget {
  final String selectedSsid;
  final ValueChanged<String> onDeviceSelected;

  const Step1DeviceDiscoveryWidget({
    super.key,
    required this.selectedSsid,
    required this.onDeviceSelected,
  });

  static const List<String> _mockDetectedDevices = [
    'esp32_kamar_utama',
    'esp32_relay_dapur',
    'esp32_smart_node',
    'esp32_sensor_teras',
    'esp32_control_panel_v2',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Top Instruction Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8.h),
                // Blue Icon Square Box
                Container(
                  width: 120.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F6FF),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.wifi,
                    color: AppTheme.primaryBlue,
                    size: 28.r,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  '1. HUBUNGKAN KE ACCESS POINT PERANGKAT DENGAN SSID ESP32_XXXX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Ponsel Anda akan memindai access point dari perangkat IoT ESP32 terdekat.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal,
                    color: AppTheme.mutedGray,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // 2. Section Header
          Text(
            '2. DAFTAR SSID ESP32_XXX YANG TERDETEKSI:',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.mutedGray,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 12.h),

          // Detected Devices List
          ..._mockDetectedDevices.map((ssid) {
            final isSelected = (ssid == selectedSsid);
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: InkWell(
                onTap: () => onDeviceSelected(ssid),
                borderRadius: BorderRadius.circular(14.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF4F8FE) : Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: isSelected ? AppTheme.primaryBlue : const Color(0xFFE2E8F0),
                      width: isSelected ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Icon Badge Box
                      Container(
                        width: 38.r,
                        height: 38.r,
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.primaryBlue : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.memory_rounded,
                          color: isSelected ? Colors.white : AppTheme.mutedGray,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 12.w),

                      // Device Text Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ssid,
                              style: TextStyle(
                                fontFamily: 'JetBrainsMono',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkCharcoal,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Sinyal: Kuat (Simulasi)',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10.sp,
                                color: AppTheme.mutedGray,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Trailing Icon (Checkmark or Chevron)
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: const Color(0xFF10B981),
                          size: 20.r,
                        )
                      else
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppTheme.mutedGray,
                          size: 20.r,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
