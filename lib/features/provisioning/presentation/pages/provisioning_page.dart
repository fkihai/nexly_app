import 'package:flutter/material.dart';
import 'package:nexly_app/core/theme/app_theme.dart';
import 'package:nexly_app/features/provisioning/presentation/widgets/provisioning_stepper_header.dart';
import 'package:nexly_app/features/provisioning/presentation/widgets/step1_device_discovery_widget.dart';
import 'package:nexly_app/features/provisioning/presentation/widgets/step2_network_config_widget.dart';
import 'package:nexly_app/features/provisioning/presentation/widgets/step3_confirmation_widget.dart';
import 'package:nexly_app/features/provisioning/presentation/widgets/step4_pairing_progress_widget.dart';

class ProvisioningPage extends StatefulWidget {
  const ProvisioningPage({super.key});

  @override
  State<ProvisioningPage> createState() => _ProvisioningPageState();
}

class _ProvisioningPageState extends State<ProvisioningPage> {
  int _currentStep = 1;

  // Form & Selection State
  String _selectedApDevice = 'esp32_kamar_utama';
  String _wifiSsid = 'IndiHome-Fiber-2.4G';
  String _wifiPassword = 'test123';
  String _deviceAlias = 'Kamar Utama';
  final String _hardwareType = 'ESP32 DevKitC';

  void _nextStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    } else {
      Navigator.maybePop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightIceBlue,
      body: SafeArea(
        child: Column(
          children: [
            // Top Stepper Header Bar
            ProvisioningStepperHeader(
              currentStep: _currentStep,
              onBackPressed: _previousStep,
            ),

            // Dynamic Step View Container
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _buildCurrentStepWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStepWidget() {
    switch (_currentStep) {
      case 1:
        return Step1DeviceDiscoveryWidget(
          key: const ValueKey(1),
          selectedSsid: _selectedApDevice,
          onDeviceSelected: (ssid) {
            setState(() {
              _selectedApDevice = ssid;
            });
            _nextStep();
          },
        );

      case 2:
        return Step2NetworkConfigWidget(
          key: const ValueKey(2),
          deviceApName: _selectedApDevice,
          selectedSsid: _wifiSsid,
          wifiPassword: _wifiPassword,
          deviceAlias: _deviceAlias,
          onSsidChanged: (val) => setState(() => _wifiSsid = val),
          onPasswordChanged: (val) => setState(() => _wifiPassword = val),
          onAliasChanged: (val) => setState(() => _deviceAlias = val),
          onSubmit: _nextStep,
        );

      case 3:
        return Step3ConfirmationWidget(
          key: const ValueKey(3),
          apName: _selectedApDevice,
          deviceAlias: _deviceAlias,
          wifiSsid: _wifiSsid,
          hardwareType: _hardwareType,
          onConfirm: _nextStep,
          onBack: _previousStep,
        );

      case 4:
        return Step4PairingProgressWidget(
          key: const ValueKey(4),
          apName: _selectedApDevice,
          onFinish: () => Navigator.maybePop(context),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
