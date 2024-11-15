import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({super.key, required this.iconPath,  this.onClick});

  final String iconPath;
  final VoidCallback? onClick;

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          alignment: Alignment.centerLeft,
          widget.iconPath,
          fit: BoxFit.contain,
          width: 28,
          height: 28,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
