import 'dart:convert';
import 'dart:developer';

import 'package:talk_time/app/controllers/platform_info.dart';
import 'package:talk_time/app/core/utils/assets_path.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/core/utils/constants.dart';
import 'package:talk_time/app/core/utils/dummy_data/users_list_data.dart';
import 'package:talk_time/app/core/utils/enums.dart';
import 'package:talk_time/app/core/utils/screen_sizes.dart';
import 'package:talk_time/app/core/utils/styles.dart';
import 'package:talk_time/app/model/user_list_model.dart';
import 'package:talk_time/app/view/chat_screen/chat_screen.dart';
import 'package:talk_time/app/view/userslist_screen/widget/bottom_nav_bar_widget.dart';
import 'package:talk_time/app/view/userslist_screen/widget/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({
    super.key,
    required this.maxWidth,
    this.isMobileScreen = false,
  });

  final double maxWidth;
  final bool isMobileScreen;

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> with TickerProviderStateMixin {
  late UserListModel userListModel;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchUsersLis();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  fetchUsersLis() {
    final Map<String, dynamic> _userList = UserDummyData.userList;
    userListModel = userListModelFromJson(json.encode(_userList));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktopScreen = isDesktop(screenWidth: widget.maxWidth);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isDesktopScreen,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Text(
                  "Contacts",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: Constants.montserratSemiBold,
                        color: ColorPalette.whitePrimaryColor,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: isDesktopScreen ? 20 : 0),
        Expanded(
          child: ListView.builder(
            itemCount: userListModel.usersList?.length ?? 0,
            shrinkWrap: true,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              UsersList? usersList = userListModel.usersList?[index];
              final String icon = usersList?.icon ?? "";
              final String name = usersList?.name ?? "";
              String mainScreen = usersList?.mainRoutes ?? "";
              bool isSelectedItem = selectedIndex == index;
              if (userListModel.usersList!.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    "No Users List...",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorPalette.whitePrimaryColor,
                          fontSize: 16,
                        ),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        selectedIndex = index;
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              maxWidth: widget.maxWidth,
                            ),
                          ),
                        );
                      },
                      child: UserItem(
                        name: name,
                        isSelectedItem: isSelectedItem,
                        icon: icon,
                        textTitleStyle: getTitleStyle(context: context, isSelectedItem: isSelectedItem),
                        textSubTitleStyle: getSubTitleStyle(context: context, isSelectedItem: isSelectedItem),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              }
            },
          ),
        ),
        const SizedBox(height: 4),
        PlatformInfo.instance.isMobileDevice
            ? const SizedBox.shrink()
            : const Center(
                child: BottomNavBarWidget(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorPalette.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
        const SizedBox(height: 10),
      ],
    );
  }
}
