import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class ActivityLogCard extends StatelessWidget {
  const ActivityLogCard({super.key});

  static const List<Map<String, String>> _logs = [
    {
      'title': 'Pendaftaran berhasil! Perangkat "Kamar Utama" terhubung ke WiFi "IndiHome-Fiber-2.4G".',
      'time': '12:46 WIB',
      'type': 'success',
    },
    {
      'title': 'Memulai pairing dan sinkronisasi server...',
      'time': '12:46 WIB',
      'type': 'info',
    },
    {
      'title': 'Mengirim kredensial Wi-Fi "IndiHome-Fiber-2.4G" ke perangkat esp32_kamar_utama...',
      'time': '12:46 WIB',
      'type': 'info',
    },
    {
      'title': 'HP berhasil terhubung ke AP esp32_kamar_utama',
      'time': '12:46 WIB',
      'type': 'info',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'LOG AKTIVITAS TERBARU',
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
            children: _logs.map((log) {
              final isSuccess = log['type'] == 'success';
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon Badge
                      Container(
                        width: 32.r,
                        height: 32.r,
                        decoration: BoxDecoration(
                          color: isSuccess
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFEFF6FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isSuccess
                              ? Icons.check_circle_outline_rounded
                              : Icons.published_with_changes_rounded,
                          color: isSuccess
                              ? const Color(0xFF16A34A)
                              : AppTheme.primaryBlue,
                          size: 18.r,
                        ),
                      ),
                      SizedBox(width: 10.w),

                      // Log Content & Timestamp
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              log['title']!,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11.sp,
                                fontWeight: isSuccess ? FontWeight.bold : FontWeight.w500,
                                color: AppTheme.darkCharcoal,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              log['time']!,
                              style: TextStyle(
                                fontFamily: 'JetBrainsMono',
                                fontSize: 9.sp,
                                color: AppTheme.mutedGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
