import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talk_time/app/core/utils/assets_path.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    super.key,
    required this.mainAxisAlignment,
    required this.decoration,
    required this.margin,
  });

  final MainAxisAlignment mainAxisAlignment;
  final Decoration decoration;
  final EdgeInsetsGeometry margin;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<String> icons = [Assets.chatIcon, Assets.statusIcon, Assets.callIcon, Assets.accountIcon];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: widget.margin,
      decoration: widget.decoration,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: List.generate(
          icons.length,
          (index) {
            return SvgPicture.asset(
              icons[index],
              colorFilter: const ColorFilter.mode(ColorPalette.whitePrimaryColor, BlendMode.srcIn),
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            );
          },
        ),
      ),
    );
  }
}
