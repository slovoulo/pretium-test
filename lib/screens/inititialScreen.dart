import 'package:flutter/material.dart';
import 'package:pretiumtest/screens/authScreens/loginScreen.dart';
import 'package:pretiumtest/screens/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}



class _InitialScreenState extends State<InitialScreen> {
  bool loginStat=false;
  @override
  void initState() {
    checkAuthStatus();
    super.initState();
  }

  checkAuthStatus()async{
    final prefs=await SharedPreferences.getInstance();
    bool loginStatus= prefs.getBool("isLoggedIn")??false;
    setState(() {
      loginStat=loginStatus;
      print("login status is $loginStat");
    });
  }
  @override
  Widget build(BuildContext context) {
    return loginStat==false?LoginPage():MainNavigationPage();
  }
}
