import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/assets_path.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/icon_widget.dart';

class ChatTextFieldWidget extends StatefulWidget {
  const ChatTextFieldWidget({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<ChatTextFieldWidget> createState() => _ChatTextFieldWidgetState();
}

class _ChatTextFieldWidgetState extends State<ChatTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: ColorPalette.whitePrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const IconWidget(iconPath: Assets.smileIcon),
          Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: widget.textEditingController,
              cursorColor: ColorPalette.blackPrimaryColor,
              showCursor: true,
              autofocus: false,
              minLines: 1,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: "Type a message",
                isDense: true,
                contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorPalette.red),
                counterText: "",
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onFieldSubmitted: (value) {},
            ),
          ),
          const IconWidget(iconPath: Assets.attachFileIcon),
          const IconWidget(iconPath: Assets.photoCameraIcon),
          const IconWidget(iconPath: Assets.sendIcon),
        ],
      ),
    );
  }
}
