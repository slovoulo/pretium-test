import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../services/themeData/theme_provider.dart';
import '../widgets.dart';
import 'authScreens/loginScreen.dart';
import 'countriesScreen.dart';

class CountriesScreen extends GetView<MyDrawerController> {
  static String routeName = "/countries";

  const CountriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: MainScreen(controller: controller),
        androidCloseOnBackTap: true,
        borderRadius: 24.0,
        showShadow: true,
        mainScreenTapClose: true,
        angle: -8.0,
        slideWidth: MediaQuery.of(context).size.width * 0.75,
        moveMenuScreen: false,
        mainScreenScale: 0.2,
        style: DrawerStyle.defaultStyle,
        //shadowLayer1Color: kLightAccent.withOpacity(0.54),
        shadowLayer1Color: kIconYellow,
        shadowLayer2Color: kPrimaryColor,
        menuBackgroundColor: themeProvider.themeMode == ThemeModeOptions.dark
            ? kGrayishBlueText
            : kToggleLight,
      ),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final MyDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: kPrimaryColorLighter,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //IconButton(onPressed: controller.toggleDrawer, icon: Icon(Icons.menu)),
            GestureDetector(
              onTap: controller.toggleDrawer,
              child: const Icon(
                Icons.menu,
                size: 40,
              ),
            ),
            //const Spacer(),

            //const Spacer(),

            ///Fix this once published
          ],
        ),
        //  iconTheme: IconThemeData(color: kTextColorBlack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const HomeScreen(),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            // color: kPrimaryColorLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(MediaQuery.of(context).size.height * 0.05),
                      Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset("assets/images/logo.png")),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dark Mode",
                            style: settingsTextStyle(),
                          ),
                          Switch(
                            inactiveTrackColor: kWhiteText,
                            value: themeProvider.themeMode ==
                                ThemeModeOptions.dark,
                            onChanged: (value) {
                              final newTheme = value
                                  ? ThemeModeOptions.dark
                                  : ThemeModeOptions.light;
                              themeProvider.setThemeMode(newTheme);
                            },
                          ),
                        ],
                      ),
                      verticalSpace(25),
                      GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.clear();
                            SystemNavigator.pop();
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }
}
