import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class TimeRangeFilterWidget extends StatefulWidget {
  const TimeRangeFilterWidget({super.key});

  @override
  State<TimeRangeFilterWidget> createState() => _TimeRangeFilterWidgetState();
}

class _TimeRangeFilterWidgetState extends State<TimeRangeFilterWidget> {
  int _selectedIndex = 0;
  final List<String> _filters = ['Hari Ini', '7 Hari Terakhir', '30 Hari'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = index == _selectedIndex;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: index < _filters.length - 1 ? 8.w : 0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.primaryBlue : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected ? AppTheme.primaryBlue : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Text(
                    _filters[index],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? Colors.white : AppTheme.darkCharcoal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
