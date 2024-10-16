import 'package:talk_time/app/core/utils/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:talk_time/app/widget/app_icon_widget.dart';

class DesktopAppBar extends StatefulWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      child: SizedBox(
        width: getCardWidth(screenWidth: screenWidth) + 20,
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: AppIconWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
