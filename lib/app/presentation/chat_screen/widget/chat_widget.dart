import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/core/utils/dummy_data/users_list_data.dart';
import 'package:talk_time/app/core/utils/enums.dart';
import 'package:talk_time/app/presentation/chat_screen/bloc/chat_bloc.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/chat_text_field_widget.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/custom_text_widget.dart';
import 'package:talk_time/app/presentation/chat_screen/widget/text_Image_widget.dart';
import 'package:talk_time/app/widget/title_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.maxWidth,
    required this.title,
    required this.subTitle,
    required this.phoneNo,
  });

  final double maxWidth;
  final String title;
  final String subTitle;
  final String phoneNo;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final String keyButtonContinue = "create_button_continue";
  final TextEditingController _chatTextFieldController = TextEditingController();

  int customWidget = 1;
  String formattedTime = "";

  @override
  void initState() {
    super.initState();
    getTime();
  }

  getTime() {
    DateTime now = DateTime.now();
    formattedTime = DateFormat.jm().format(now); // "08:30 PM"
  }

  @override
  void dispose() {
    _chatTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktopScreen = widget.maxWidth >= 652;
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(minHeight: 600),
      decoration: BoxDecoration(
        color: ColorPalette.primary,
        borderRadius: isDesktopScreen ? const BorderRadius.all(Radius.circular(14)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          isDesktopScreen
              ? TitleWidget(
                  isDesktopScreen: isDesktopScreen,
                  title: widget.title,
                  subTitle: widget.subTitle,
                )
              : const SizedBox.shrink(),
          isDesktopScreen
              ? Divider(
                  color: ColorPalette.blackPrimaryColor.shade100.withOpacity(0.4),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 4),
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                switch (state) {
                  case ChatError():
                    return Text('Something went wrong!: ${state.errorMessage}');
                  case NoMessages():
                    return const Center(
                      child: Text(
                        'No Messages!',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    );
                  case LoadMessages():
                    return ListView.separated(
                      itemCount: state.messages.length,
                      shrinkWrap: true,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 14);
                      },
                      itemBuilder: (context, index) {
                        if ((state.messages[index].widgetType) == Types.text.name) {
                          return ChatTextWidget(
                            isUser: (state.messages[index].senderId) == UserDummyData.userId,
                            text: state.messages[index].messageText ?? "",
                            time: formattedTime,
                          );
                        } else if ((state.messages[index].widgetType ?? "") == Types.imageText.name) {
                          return ImageTextWidget(
                            isUser: (state.messages[index].senderId) == UserDummyData.userId,
                            text: state.messages[index].messageText ?? "",
                            image: state.messages[index].filePath ?? "",
                            time: formattedTime,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    );
                  default:
                    return const Center(
                      child: Text(
                        'No Messages!',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    );
                }
              },
            ),
          ),
          const SizedBox(height: 4),
          ChatTextFieldWidget(
            key: const ValueKey("ChatTextField"),
            onClick: () {
              context.read<ChatBloc>().add(FetchOrSendMessages(
                    receiverId: widget.phoneNo,
                    message: _chatTextFieldController.text.trim(),
                    isSend: true,
                  ));
              _chatTextFieldController.text = "";
            },
            textEditingController: _chatTextFieldController,
          ),
        ],
      ),
    );
  }
}
