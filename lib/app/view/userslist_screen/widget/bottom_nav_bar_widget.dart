import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talk_time/app/core/utils/assets_path.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<String> icons = [Assets.chatIcon, Assets.statusIcon, Assets.callIcon, Assets.accountIcon];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: const BoxDecoration(
        color: ColorPalette.primary,
        borderRadius:  BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) {
            return SvgPicture.asset(
              icons[index],
              //colorFilter: ColorFilter(),
              color: ColorPalette.whitePrimaryColor,
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
