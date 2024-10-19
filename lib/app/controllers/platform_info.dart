import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/enums.dart';
import 'package:talk_time/app/core/utils/extensions.dart';

class PlatformInfo {
  // Private constructor
  PlatformInfo._internal();

  // The single instance of PlatformInfo
  static final PlatformInfo _instance = PlatformInfo._internal();

  // Getter for the singleton instance
  static PlatformInfo get instance => _instance;

  // Variable to store the platform type
  PlatformType? _platformType;

  // Method to initialize and save the current platform
  void initialize(BuildContext context) {
    // Set the platform type using the context
    _platformType = context.platformType;
    setDeviceType();
  }

  bool _isMobileDevice = false;
  bool get isMobileDevice => _isMobileDevice;

  bool _isDesktop = false;
  bool get isDesktop => _isDesktop;

  bool _isWeb = false;
  bool get isWeb => _isWeb;

  // Getter for platformType
  PlatformType get platformType {
    if (_platformType == null) {
      throw Exception('PlatformInfo is not initialized. Call initialize() first.');
    }
    return _platformType!;
  }

  // Method to get device type based on platform
  void setDeviceType() {
    if (platformType == PlatformType.android || _platformType == PlatformType.ios) {
      _isMobileDevice = true;
      _isDesktop = false;
      _isWeb = false;
      return;
    }
    bool isDesktop = (platformType == PlatformType.windows) || (platformType == PlatformType.macos) || (platformType == PlatformType.linux);
    if (isDesktop) {
      _isDesktop = true;
      _isMobileDevice = false;
      _isWeb = false;
      return;
    }
    if (kIsWeb) {
      _isWeb = true;
      _isMobileDevice = false;
      _isDesktop = false;
      return;
    } else {
      _isMobileDevice = false;
      _isDesktop = false;
      _isWeb = false;
      return;
    }
  }
}
