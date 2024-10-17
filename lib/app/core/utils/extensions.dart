import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/enums.dart';

extension PlatformExtension on BuildContext {
  PlatformType get platformType {
    switch (Theme.of(this).platform) {
      case TargetPlatform.android:
        return PlatformType.android;
      case TargetPlatform.iOS:
        return PlatformType.ios;
      case TargetPlatform.macOS:
        return PlatformType.macos;
      case TargetPlatform.windows:
        return PlatformType.windows;
      case TargetPlatform.linux:
        return PlatformType.linux;
      default:
        return PlatformType.unknown;
    }
  }
}
