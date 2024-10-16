import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/view/chat_screen/widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:talk_time/app/widget/title_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryContainer,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: ColorPalette.whitePrimaryColor),
        ),
        title: const TitleWidget(
          isDesktopScreen: false,
          title: "Tulasi Reddy",
          subTitle: "Online",
        ),
      ),
      body: SafeArea(
        child: ChatWidget(
          maxWidth: widget.maxWidth,
          title: "Tulasi Reddy",
          subTitle: "Online",
        ),
      ),
    );
  }
}
