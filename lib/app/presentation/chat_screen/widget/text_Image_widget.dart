import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/core/utils/constants.dart';

class ImageTextWidget extends StatelessWidget {
  const ImageTextWidget({
    super.key,
    required this.text,
    required this.image,
    required this.isUser,
    required this.time,
  });

  final String text;
  final String time;
  final String image;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: SizedBox(
        width: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: isUser ? Alignment.topRight : Alignment.topLeft,
              decoration: BoxDecoration(
                color: ColorPalette.purple,
                borderRadius: isUser
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                      )
                    : const BorderRadius.only(
                        topRight: Radius.circular(6.0),
                      ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Text(
                text,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 14,
                  color: ColorPalette.whitePrimaryColor,
                ),
              ),
            ),
            Visibility(
              visible: image.isNotEmpty,
              child: Container(
                height: 140,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: isUser
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(6.0), // Bottom-left corner radius
                        )
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(6.0), // Bottom-left corner radius
                        ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Align(
              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                time,
                softWrap: true,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorPalette.whitePrimaryColor,
                  fontFamily: Constants.montserratRegular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
