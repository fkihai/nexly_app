import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class AddScheduleCard extends StatefulWidget {
  final VoidCallback onAddSchedule;

  const AddScheduleCard({
    super.key,
    required this.onAddSchedule,
  });

  @override
  State<AddScheduleCard> createState() => _AddScheduleCardState();
}

class _AddScheduleCardState extends State<AddScheduleCard> {
  String _selectedSwitch = 'Saklar 1 (Lampu)';
  String _selectedAction = 'Hidupkan (ON)';
  final TextEditingController _timeController =
      TextEditingController(text: '08:00 AM');

  static const List<String> _switchOptions = [
    'Saklar 1 (Lampu)',
    'Saklar 2 (Pompa Air)',
  ];

  static const List<String> _actionOptions = [
    'Hidupkan (ON)',
    'Matikan (OFF)',
  ];

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.add_rounded,
                  color: AppTheme.primaryBlue,
                  size: 18.r,
                ),
                SizedBox(width: 6.w),
                Text(
                  'TAMBAH JADWAL BARU',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // Row 1: Pilih Saklar & Aksi Dropdowns
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Saklar',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10.sp,
                          color: AppTheme.mutedGray,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      _buildDropdown(
                        value: _selectedSwitch,
                        items: _switchOptions,
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedSwitch = val);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aksi',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10.sp,
                          color: AppTheme.mutedGray,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      _buildDropdown(
                        value: _selectedAction,
                        items: _actionOptions,
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedAction = val);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // Row 2: Waktu Pelaksanaan & Button
            Text(
              'Waktu Pelaksanaan (WIB)',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10.sp,
                color: AppTheme.mutedGray,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _timeController.text,
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkCharcoal,
                          ),
                        ),
                        Icon(
                          Icons.access_time_rounded,
                          color: AppTheme.mutedGray,
                          size: 18.r,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: widget.onAddSchedule,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Tambah',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppTheme.darkCharcoal,
            size: 20.r,
          ),
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.darkCharcoal,
          ),
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
