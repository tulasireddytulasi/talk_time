import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/enums.dart';
import 'package:talk_time/app/core/utils/extensions.dart';

String getDeviceType(BuildContext context) {
  PlatformType platformType = context.platformType;

  if (platformType == PlatformType.android || platformType == PlatformType.ios) {
    return 'Mobile';
  } else if (platformType == PlatformType.windows ||
      platformType == PlatformType.macos ||
      platformType == PlatformType.linux) {
    return 'Desktop';
  } else {
    return 'Unknown';
  }
}
