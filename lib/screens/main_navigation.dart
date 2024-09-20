import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pretiumtest/screens/profileScreen.dart';
import 'package:pretiumtest/screens/utilitiesScreen.dart';

import 'package:provider/provider.dart';


import '../../constants.dart';
import '../services/themeData/theme_provider.dart';
import 'infoScreen.dart';

_MainNavigationPageState mainNavigationPageState = _MainNavigationPageState();

class MainNavigationPage extends StatefulWidget {
  static String routeName = "/main_page";


   MainNavigationPage({Key? key}) : super(key: key);

  @override
  _MainNavigationPageState createState() {
    mainNavigationPageState = _MainNavigationPageState();
    return mainNavigationPageState;
  }
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late DateTime currentBackPressTime;
  bool hasReviewedApp=false;

  PersistentTabController? controller;
  TextStyle style = const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    currentBackPressTime = DateTime.now();
    controller = PersistentTabController(initialIndex: 0);



  }





  List<Widget> _buildScreens() {
    return [
      const CountriesScreen(),
      const UtilitiesScreen(),
      const ProfileScreen(),
      //Container()

    ];
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.support),
          title:"Countries",

        //  textStyle: style,
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.production_quantity_limits),
          title: "Utilities",

          //   textStyle: style,
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey,
         
        ),
        
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profile",

          //   textStyle: style,
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              '/countries': (context) => const CountriesScreen(),
              '/utilities': (context) => const UtilitiesScreen(),
              '/profile': (context) => const ProfileScreen(),
              
            },
          ),
        ),
        // PersistentBottomNavBarItem(icon: Icon(Icons.add))

      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(8),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: themeProvider.themeMode == ThemeModeOptions.dark
          ? kToggleDark
          :kLightAppbar, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        //colorBehindNavBar: Colors.white,
      ),

      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,


      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
