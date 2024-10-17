import 'package:flutter/material.dart';
import 'package:talk_time/app/controllers/platform_info.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';

TextStyle getTitleStyle({required BuildContext context, bool? isSelectedItem}) {
  TextStyle textStyle;
  if (PlatformInfo.instance.isMobileDevice) {
    textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          color: ColorPalette.whitePrimaryColor,
          fontSize: 16,
        );
  } else {
    textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          color: isSelectedItem! ? ColorPalette.whitePrimaryColor : ColorPalette.whitePrimaryColor.withOpacity(0.6),
          fontSize: 16,
        );
  }
  return textStyle;
}

TextStyle getSubTitleStyle({required BuildContext context, required bool isSelectedItem}) {
  TextStyle textStyle;
  textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
    overflow: TextOverflow.ellipsis,
    color: (!PlatformInfo.instance.isMobileDevice && isSelectedItem) ? ColorPalette.whitePrimaryColor : ColorPalette.whitePrimaryColor.withOpacity(0.6),
    fontSize: 12,
  );
  return textStyle;
}
