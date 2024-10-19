import 'package:talk_time/app/controllers/platform_info.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/core/utils/screen_sizes.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/chat_widget.dart';
import 'package:talk_time/app/presentation/userslist_screen/user_list_screen.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({
    super.key,
    required this.maxWidthAndHeight,
  });

  final BoxConstraints maxWidthAndHeight;

  @override
  State<MainContainer> createState() => _MainContainerState();
}

int getUsersListScreenSize(maxSize) {
  int size = 3;
  if (maxSize <= 800) {
    size = 4;
  }
  if (maxSize <= 600) {
    size = 5;
  }
  return size;
}

int getChatScreenSize(maxSize) {
  int size = 7;
  if (maxSize <= 800) {
    size = 6;
  }
  if (maxSize <= 600) {
    size = 5;
  }
  return size;
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = widget.maxWidthAndHeight.maxWidth;
    bool isDesktopScreen = isDesktop(screenWidth: maxWidth);
    return Container(
      width: maxWidth,
      alignment: Alignment.topCenter,
      height: widget.maxWidthAndHeight.maxHeight,
      padding: EdgeInsets.only(
        left: 0,
        right: isDesktopScreen ? 6 : 0,
        top: isDesktopScreen ? 6 : 0,
        bottom: isDesktopScreen ? 6 : 0,
      ),
      margin: EdgeInsets.only(top: isDesktopScreen ? 20 : 0),
      decoration: BoxDecoration(
        color: PlatformInfo.instance.isMobileDevice ? ColorPalette.primary : ColorPalette.primaryContainer,
        borderRadius: isDesktopScreen ? const BorderRadius.all(Radius.circular(20)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: getUsersListScreenSize(maxWidth),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 0, left: 0),
              child: UsersListScreen(
                maxWidth: widget.maxWidthAndHeight.maxWidth,
              ),
            ),
          ),
          Visibility(
            visible: maxWidth >= 450,
            child: Expanded(
              flex: getChatScreenSize(maxWidth),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ChatWidget(
                    maxWidth: maxWidth,
                    title: "Tulasi Reddy",
                    subTitle: "Online",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
