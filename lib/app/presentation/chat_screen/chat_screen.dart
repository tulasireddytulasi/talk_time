import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:talk_time/app/widget/title_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.maxWidth,
    required this.phoneNo,
    required this.name,
  });

  final double maxWidth;
  final String phoneNo;
  final String name;

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
        title: TitleWidget(
          isDesktopScreen: false,
          title: widget.name,
          subTitle: "Online",
        ),
      ),
      body: SafeArea(
        child: ChatWidget(
          maxWidth: widget.maxWidth,
          title: widget.name,
          subTitle: "Online",
          phoneNo: widget.phoneNo,
        ),
      ),
    );
  }
}
