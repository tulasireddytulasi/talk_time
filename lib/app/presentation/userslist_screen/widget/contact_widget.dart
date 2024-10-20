import 'dart:typed_data';

import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({
    super.key,
    required this.name,
    required this.isSelectedItem,
    required this.icon,
    this.margin = EdgeInsets.zero,
    required this.textTitleStyle,
    required this.textSubTitleStyle,
    this.animation, required this.lastMessage,
  });

  final Uint8List icon;
  final String name;
  final String lastMessage;
  final bool isSelectedItem;
  final EdgeInsetsGeometry margin;
  final TextStyle textTitleStyle;
  final TextStyle textSubTitleStyle;
  final Animation<double>? animation;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          margin: widget.margin,
          decoration: widget.isSelectedItem
              ? ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-1, 0),
                    end: const Alignment(1.00, -0.00),
                    colors: [
                      ColorPalette.primary,
                      ColorPalette.primary.withOpacity(0),
                    ],
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                )
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 20),
              Visibility(
                visible: widget.icon.isNotEmpty,
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: ClipOval(
                    child: Image.memory(widget.icon),
                  ),
                )
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: widget.icon.isNotEmpty,
                child: const SizedBox(width: 6),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: widget.textTitleStyle,
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                   width: constraints.maxWidth - 130,
                    child: Text(
                      widget.lastMessage,
                    maxLines: 1,
                      softWrap: true,
                      style: widget.textSubTitleStyle,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: widget.icon.isNotEmpty,
                child: const Spacer(),
              ),
              Visibility(
                visible: widget.icon.isNotEmpty,
                child: RotationTransition(
                  turns: widget.animation == null ? const AlwaysStoppedAnimation(0.0) : widget.animation!,
                  child: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: ColorPalette.whitePrimaryColor.withOpacity(0.4),
                  ),
                ),
              ),
              Visibility(visible: widget.icon.isNotEmpty, child: const SizedBox(width: 6)),
            ],
          ),
        );
      }
    );
  }
}
