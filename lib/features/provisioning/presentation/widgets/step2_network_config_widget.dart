import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexly_app/core/theme/app_theme.dart';

class Step2NetworkConfigWidget extends StatefulWidget {
  final String deviceApName;
  final String selectedSsid;
  final String wifiPassword;
  final String deviceAlias;
  final ValueChanged<String> onSsidChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onAliasChanged;
  final VoidCallback onSubmit;

  const Step2NetworkConfigWidget({
    super.key,
    required this.deviceApName,
    required this.selectedSsid,
    required this.wifiPassword,
    required this.deviceAlias,
    required this.onSsidChanged,
    required this.onPasswordChanged,
    required this.onAliasChanged,
    required this.onSubmit,
  });

  @override
  State<Step2NetworkConfigWidget> createState() =>
      _Step2NetworkConfigWidgetState();
}

class _Step2NetworkConfigWidgetState extends State<Step2NetworkConfigWidget> {
  bool _obscurePassword = true;
  late TextEditingController _passwordController;
  late TextEditingController _aliasController;

  static const List<String> _availableSsids = [
    'IndiHome-Fiber-2.4G',
    'MyHome_WiFi_5G',
    'Biznet_Home_Guest',
    'TP-Link_Router_Extender',
  ];

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController(text: widget.wifiPassword);
    _aliasController = TextEditingController(text: widget.deviceAlias);
  }

  @override
  void didUpdateWidget(covariant Step2NetworkConfigWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.wifiPassword != widget.wifiPassword &&
        _passwordController.text != widget.wifiPassword) {
      _passwordController.text = widget.wifiPassword;
    }
    if (oldWidget.deviceAlias != widget.deviceAlias &&
        _aliasController.text != widget.deviceAlias) {
      _aliasController.text = widget.deviceAlias;
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _aliasController.dispose();
    super.dispose();
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3. ATUR KONEKSI WI-FI RUMAH',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkCharcoal,
                  ),
                ),
                SizedBox(height: 6.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11.sp,
                      color: AppTheme.mutedGray,
                      height: 1.4,
                    ),
                    children: [
                      const TextSpan(
                          text:
                              'Masukkan kredensial Wi-Fi rumah agar perangkat '),
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            widget.deviceApName,
                            style: TextStyle(
                              fontFamily: 'JetBrainsMono',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ' dapat terhubung ke cloud.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // 2. Form Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label: PILIH SSID WIFI RUMAH
                Text(
                  'PILIH SSID WIFI RUMAH',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mutedGray,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 8.h),

                // Dropdown SSID Selector
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _availableSsids.contains(widget.selectedSsid)
                          ? widget.selectedSsid
                          : _availableSsids.first,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppTheme.darkCharcoal,
                        size: 22.r,
                      ),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        color: AppTheme.darkCharcoal,
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (val) {
                        if (val != null) widget.onSsidChanged(val);
                      },
                      items: _availableSsids.map((ssid) {
                        return DropdownMenuItem<String>(
                          value: ssid,
                          child: Text(ssid),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // Label: PASSWORD WIFI
                Text(
                  'PASSWORD WIFI',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mutedGray,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 8.h),

                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onChanged: widget.onPasswordChanged,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13.sp,
                    color: AppTheme.darkCharcoal,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan password Wi-Fi',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: _obscurePassword
                            ? AppTheme.mutedGray
                            : AppTheme.primaryBlue,
                        size: 20.r,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                const Divider(color: Color(0xFFF1F5F9), height: 1),
                SizedBox(height: 16.h),

                // Label: NAMA PERANGKAT (ALIAS)
                Text(
                  'NAMA PERANGKAT (ALIAS)',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mutedGray,
                    letterSpacing: 0.3,
                  ),
                ),
                SizedBox(height: 8.h),

                // Alias TextField
                TextField(
                  controller: _aliasController,
                  onChanged: widget.onAliasChanged,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13.sp,
                    color: AppTheme.darkCharcoal,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Contoh: Kamar Utama',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Submit Button
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: widget.onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Set Wi-Fi',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
