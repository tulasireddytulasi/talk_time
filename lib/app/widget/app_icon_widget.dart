import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talk_time/app/core/utils/assets_path.dart';
import 'package:talk_time/app/core/utils/constants.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          Assets.moviesIcon,
          fit: BoxFit.contain,
          width: 34,
          height: 34,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        ),
        const SizedBox(width: 2),
        Text(
          "Multi-Verse Movies",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
            fontFamily: Constants.montserratBold,
          ),
        ),
      ],
    );
  }
}
