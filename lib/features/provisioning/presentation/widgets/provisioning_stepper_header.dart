import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class ProvisioningStepperHeader extends StatelessWidget {
  final int currentStep;
  final VoidCallback? onBackPressed;

  const ProvisioningStepperHeader({
    super.key,
    required this.currentStep,
    this.onBackPressed,
  });

  String get _title {
    switch (currentStep) {
      case 1:
        return 'Pilih AP Perangkat';
      case 2:
        return 'Set Wi-Fi';
      case 3:
        return 'Konfirmasi Tambah';
      case 4:
        return 'Sedang Pairing...';
      default:
        return 'Provisioning';
    }
  }

  String get _subStepLabel {
    switch (currentStep) {
      case 1:
        return 'HUBUNGKAN AP ESP32_XXXX';
      case 2:
        return 'KONFIGURASI WI-FI';
      case 3:
        return 'KONFIRMASI PERANGKAT';
      case 4:
        return 'SINKRONISASI CLOUD';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double progress = (currentStep / 4.0).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Bar Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppTheme.darkCharcoal,
                  size: 22.r,
                ),
                onPressed: onBackPressed ?? () => Navigator.maybePop(context),
              ),
              Expanded(
                child: Text(
                  _title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                  ),
                ),
              ),
              SizedBox(width: 48.w), // Balance back button
            ],
          ),
        ),
        SizedBox(height: 8.h),
        // Step subheader labels
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LANGKAH $currentStep DARI 4',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryBlue,
                  letterSpacing: 0.5,
                ),
              ),
              Flexible(
                child: Text(
                  _subStepLabel,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryBlue,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        // Linear Progress Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4.h,
              backgroundColor: const Color(0xFFE2E8F0),
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
