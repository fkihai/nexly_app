import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class Step4PairingProgressWidget extends StatefulWidget {
  final String apName;
  final VoidCallback? onFinish;

  const Step4PairingProgressWidget({
    super.key,
    required this.apName,
    this.onFinish,
  });

  @override
  State<Step4PairingProgressWidget> createState() => _Step4PairingProgressWidgetState();
}

class _Step4PairingProgressWidgetState extends State<Step4PairingProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),

          // 1. Animated Circular Microchip Progress Loader
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100.r,
                height: 100.r,
                child: RotationTransition(
                  turns: _rotationController,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.5.w,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
                    backgroundColor: const Color(0xFFF1F5F9),
                  ),
                ),
              ),
              Container(
                width: 80.r,
                height: 80.r,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.developer_board_rounded,
                  color: AppTheme.primaryBlue,
                  size: 36.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // 2. Headline & Subtitle
          Text(
            'Sedang Menambahkan & Pairing...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkCharcoal,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Mengirim konfigurasi, mendaftarkan node ke server cloud MQTT.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12.sp,
                color: AppTheme.mutedGray,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 28.h),

          // 3. System Console / Log Terminal Box
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1117), // Dark navy / terminal bg
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Terminal Header Title
                Text(
                  'SYSTEM LOGS FOR PAIRING',
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF10B981), // Emerald green
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 12.h),

                // Log Line 1
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 11.sp,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(
                        text: '[1] Connecting: ',
                        style: TextStyle(color: Color(0xFF94A3B8)),
                      ),
                      TextSpan(
                        text: widget.apName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Log Line 2
                Text(
                  '[2] Sending Wi-Fi credentials...',
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 11.sp,
                    color: const Color(0xFF94A3B8),
                    height: 1.6,
                  ),
                ),

                // Log Line 3 (Active highlight step)
                Text(
                  '[3] Synchronizing with cloud broker...',
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFACC15), // Yellow active line
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
