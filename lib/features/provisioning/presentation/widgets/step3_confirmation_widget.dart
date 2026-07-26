import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class Step3ConfirmationWidget extends StatelessWidget {
  final String apName;
  final String deviceAlias;
  final String wifiSsid;
  final String hardwareType;
  final VoidCallback onConfirm;
  final VoidCallback onBack;

  const Step3ConfirmationWidget({
    super.key,
    required this.apName,
    required this.deviceAlias,
    required this.wifiSsid,
    required this.hardwareType,
    required this.onConfirm,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          // 1. Centered Yellow Warning Icon Circle
          Container(
            width: 72.r,
            height: 72.r,
            decoration: BoxDecoration(
              color: const Color(0xFFFEF9C3), // Light yellow
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFEF08A), width: 2),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppTheme.warningAmber,
              size: 36.r,
            ),
          ),
          SizedBox(height: 20.h),

          // 2. Headline & Subtitle
          Text(
            '4. Apakah yakin untuk menambahkan\nperangkat?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkCharcoal,
              height: 1.3,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Harap periksa kembali detail konfigurasi sebelum memulai proses registrasi server.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12.sp,
                color: AppTheme.mutedGray,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 24.h),

          // 3. Configuration Details Summary Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildSummaryRow(
                  label: 'AP Perangkat',
                  valueWidget: Text(
                    apName,
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkCharcoal,
                    ),
                  ),
                ),
                Divider(color: const Color(0xFFF1F5F9), height: 20.h),
                _buildSummaryRow(
                  label: 'Nama Alias',
                  valueWidget: Text(
                    deviceAlias,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                ),
                Divider(color: const Color(0xFFF1F5F9), height: 20.h),
                _buildSummaryRow(
                  label: 'Koneksi WiFi',
                  valueWidget: Text(
                    wifiSsid,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.darkCharcoal,
                    ),
                  ),
                ),
                Divider(color: const Color(0xFFF1F5F9), height: 20.h),
                _buildSummaryRow(
                  label: 'Tipe Hardware',
                  valueWidget: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      hardwareType,
                      style: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkCharcoal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),

          // 4. Action Buttons
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Iya, Tambahkan',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFFF8FAFC),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Kembali',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkCharcoal,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({required String label, required Widget valueWidget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.sp,
            color: AppTheme.mutedGray,
          ),
        ),
        valueWidget,
      ],
    );
  }
}
