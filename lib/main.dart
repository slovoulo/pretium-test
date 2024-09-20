import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pretiumtest/screens/infoScreen.dart';
import 'package:pretiumtest/screens/inititialScreen.dart';
import 'package:pretiumtest/screens/main_navigation.dart';
import 'package:pretiumtest/services/checkConnectivity.dart';
import 'package:pretiumtest/services/themeData/theme_provider.dart';
import 'package:pretiumtest/services/themeData/themedata.dart';
import 'package:provider/provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Get.put<MyDrawerController>(MyDrawerController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (_) => ThemeProvider()),],builder: (context,_){
      return Consumer<ThemeProvider>(builder: (context,themeProvider,_){
        return MaterialApp(
          title: 'Connectivity Monitor',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode == ThemeModeOptions.light
              ? ThemeMode.light
              : ThemeMode.dark,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: ConnectivityWrapper(child: InitialScreen()),
        );
      });
    },);
  }
}



