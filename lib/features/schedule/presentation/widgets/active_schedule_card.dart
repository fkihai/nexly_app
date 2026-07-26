import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class ActiveScheduleCard extends StatefulWidget {
  const ActiveScheduleCard({super.key});

  @override
  State<ActiveScheduleCard> createState() => _ActiveScheduleCardState();
}

class _ActiveScheduleCardState extends State<ActiveScheduleCard> {
  bool _schedule1Active = true;
  bool _schedule2Active = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'DAFTAR JADWAL AKTIF (2)',
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
              // Schedule Item 1
              _buildScheduleItem(
                title: 'Saklar Utama Lampu',
                actionText: 'ON',
                isActionOn: true,
                timeText: '06:00 WIB',
                isActive: _schedule1Active,
                onToggle: (val) => setState(() => _schedule1Active = val),
              ),
              SizedBox(height: 10.h),

              // Schedule Item 2
              _buildScheduleItem(
                title: 'Saklar Cadangan / Pompa Air',
                actionText: 'OFF',
                isActionOn: false,
                timeText: '18:00 WIB',
                isActive: _schedule2Active,
                onToggle: (val) => setState(() => _schedule2Active = val),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleItem({
    required String title,
    required String actionText,
    required bool isActionOn,
    required String timeText,
    required bool isActive,
    required ValueChanged<bool> onToggle,
  }) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Clock Icon Badge
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.access_time_rounded,
                  color: AppTheme.primaryBlue,
                  size: 18.r,
                ),
              ),
              SizedBox(width: 10.w),

              // Title & Action Badge
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
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Text(
                          'Aksi: ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10.sp,
                            color: AppTheme.mutedGray,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: isActionOn
                                ? const Color(0xFFDCFCE7)
                                : const Color(0xFFFEE2E2),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            actionText,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: isActionOn
                                  ? const Color(0xFF15803D)
                                  : const Color(0xFFB91C1C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Switch Toggle
              Switch(
                value: isActive,
                activeThumbColor: Colors.white,
                activeTrackColor: AppTheme.primaryBlue,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: const Color(0xFFE2E8F0),
                onChanged: onToggle,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: Color(0xFFF1F5F9), height: 1),
          SizedBox(height: 10.h),

          // Bottom Bar: Time Text & Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeText,
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkCharcoal,
                ),
              ),
              Row(
                children: [
                  // Uji Coba Button
                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Simulasi $title dijalankan'),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: const Color(0xFFD97706),
                      size: 14.r,
                    ),
                    label: Text(
                      'Uji Coba',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFD97706),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFDE68A)),
                      backgroundColor: const Color(0xFFFEF3C7),
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // Delete Icon
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: AppTheme.mutedGray,
                      size: 18.r,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Jadwal berhasil dihapus'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
