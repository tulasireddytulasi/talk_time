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
    deviceType();
  }

  bool _isMobileDevice = false;
  bool get isMobileDevice => _isMobileDevice;

  // Getter for platformType
  PlatformType get platformType {
    if (_platformType == null) {
      throw Exception('PlatformInfo is not initialized. Call initialize() first.');
    }
    return _platformType!;
  }

  // Method to get device type based on platform
  void deviceType() {
    if (currentDeviceType == PlatformType.mobile) {
      _isMobileDevice = true;
    } else if (currentDeviceType == PlatformType.desktop) {
      _isMobileDevice = false;
    } else if (currentDeviceType == PlatformType.unknown) {
      _isMobileDevice = false;
    }
  }

  // Method to get device type based on platform
  PlatformType get currentDeviceType {
    if (_platformType == PlatformType.android || _platformType == PlatformType.ios) {
      return PlatformType.mobile;
    } else if (_platformType == PlatformType.windows ||
        _platformType == PlatformType.macos ||
        _platformType == PlatformType.linux) {
      return PlatformType.desktop;
    } else {
      return PlatformType.unknown;
    }
  }
}
