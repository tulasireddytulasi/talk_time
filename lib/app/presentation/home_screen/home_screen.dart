import 'package:talk_time/app/controllers/platform_info.dart';
import 'package:talk_time/app/core/utils/constants.dart';
import 'package:talk_time/app/domain/get_contacts_use_case.dart';
import 'package:talk_time/app/presentation/home_screen/bloc/home_bloc.dart';
import 'package:talk_time/app/presentation/home_screen/widget/main_container_widget.dart';
import 'package:talk_time/app/presentation/userslist_screen/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:talk_time/app/core/utils/color_palette.dart';
import 'package:talk_time/app/core/utils/screen_sizes.dart';
import 'package:talk_time/app/presentation/userslist_screen/widget/bottom_nav_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.getContactsUseCase});
  final GetContactsUseCase getContactsUseCase;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeBloc homeBloc = HomeBloc(getContactsUseCase: widget.getContactsUseCase);
      homeBloc.add(FetchContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktopScreen = isDesktop(screenWidth: constraints.maxWidth);
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorPalette.whitePrimaryColor.shade100,
        appBar: isDesktopScreen
            ? null
            : AppBar(
                leadingWidth: 0,
                backgroundColor: ColorPalette.primary,
                actions: const [],
                elevation: 6,
                title: const Text(
                  "TalkTime",
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    color: ColorPalette.purple,
                    fontFamily: Constants.montserratBold,
                  ),
                ),
                centerTitle: false,
              ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        drawer: Container(
          decoration: BoxDecoration(
            color: ColorPalette.primaryContainer, // Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          width: constraints.maxWidth - 80,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 40, left: 14),
          child: UsersListScreen(
            maxWidth: (constraints.maxWidth - 80),
            isMobileScreen: true,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: getCardWidth(screenWidth: constraints.maxWidth),
                    margin: isDesktopScreen ? const EdgeInsets.only(left: 20, right: 20, bottom: 20) : null,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return isDesktopScreen
                            ? Card(
                                elevation: 0,
                                color: ColorPalette.whitePrimaryColor.shade100,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: MainContainer(
                                  maxWidthAndHeight: constraints,
                                ),
                              )
                            : MainContainer(
                                maxWidthAndHeight: constraints,
                              );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: PlatformInfo.instance.isMobileDevice ?  BottomNavBarWidget(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: ColorPalette.primary,
            border: Border(top: BorderSide(color: ColorPalette.whitePrimaryColor.shade100, width: 1)),
          ),
        ) : const SizedBox.shrink(),
      );
    });
  }
}
