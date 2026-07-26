import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class TelemetryChartCard extends StatelessWidget {
  const TelemetryChartCard({super.key});

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
          children: [
            // Chart Legend Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Suhu (Temp)',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkCharcoal,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration: const BoxDecoration(
                        color: Color(0xFF60A5FA),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Kelembapan (Hum)',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkCharcoal,
                      ),
                    ),
                  ],
                ),
                Text(
                  '24 Jam Terakhir',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 9.sp,
                    color: AppTheme.mutedGray,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Chart Canvas
            SizedBox(
              height: 130.h,
              width: double.infinity,
              child: CustomPaint(
                painter: _TelemetryChartPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TelemetryChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line1Paint = Paint()
      ..color = AppTheme.primaryBlue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final line2Paint = Paint()
      ..color = const Color(0xFF60A5FA)
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    final gridPaint = Paint()
      ..color = const Color(0xFFF1F5F9)
      ..strokeWidth = 1.0;

    // Draw background horizontal grid lines
    for (int i = 1; i <= 3; i++) {
      final y = size.height * (i / 4);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Line 1 Path (Suhu)
    final path1 = Path();
    path1.moveTo(0, size.height * 0.4);
    path1.cubicTo(
      size.width * 0.25, size.height * 0.2,
      size.width * 0.5, size.height * 0.6,
      size.width * 0.75, size.height * 0.3,
    );
    path1.lineTo(size.width, size.height * 0.35);

    // Line 2 Path (Kelembapan)
    final path2 = Path();
    path2.moveTo(0, size.height * 0.65);
    path2.cubicTo(
      size.width * 0.3, size.height * 0.7,
      size.width * 0.6, size.height * 0.45,
      size.width * 0.85, size.height * 0.55,
    );
    path2.lineTo(size.width, size.height * 0.6);

    // Fill Gradient under path 1
    final fillPath = Path.from(path1)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppTheme.primaryBlue.withValues(alpha: 0.15),
        AppTheme.primaryBlue.withValues(alpha: 0.0),
      ],
    );

    canvas.drawPath(fillPath, Paint()..shader = fillGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
    canvas.drawPath(path1, line1Paint);
    canvas.drawPath(path2, line2Paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
