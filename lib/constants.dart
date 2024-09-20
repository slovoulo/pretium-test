import 'package:flutter/material.dart';


const int maxFailedLoadAttempts=3;
///Icon colors
const kIconBlue = Color(0xFF2398cd);
const kIconPurple = Color(0xFF8f3b9d);
const kIconYellow = Color(0xFFd59a3e);
const kIconPink = Color(0xFFbe6060);
const kIconDeepBlue = Color(0xFF2f518e);
///Primary colors
const kPrimaryColor = Color(0xFF157C73);
const kPrimaryLight = Color(0xFFA3CFCB);

///Dark theme
//Backgrounds
//const kMainBlue = Color(0xFF3a4764);
const kDarkScaffold = Color(0xFF0d0d0d);

const kToggleDark = Color(0xFF161616);
const kScreenDark = Color(0xFF262626);
const kDarkCard = Color(0xFF262626);
const kDarkAppbar = Color(0xFF262626);
//const kScreenBlue = Color(0xFF182034);

//Keys

const kKeyRedBG = Color(0xFFff0000);
const kKeyShadowRed = Color(0xFF93261a);
const kLightGrayishOrange = Color(0xFFeae3dc);
const kGrayishOrange = Color(0xFFb4a597);

//Text
const kGrayishBlueText = Color(0xFF444b5a);
const kWhiteText = Color(0xFFffffff);

///Light Theme
//Backgrounds
const kScaffoldColor = Color(0xFFF0F3F3);
const kToggleLight = Color(0xFFd1cccc);
const kScreenGray = Color(0xFFededed);

const kLightAccent = Color(0xFFfa9500);


const kLighterGreenAccent = Color(0xFFc9ccc5);
const kLightAppbar = Color(0xFFededed);
const kDarkBold = Color(0xFFa7a7a7);
const kLightDisabledColor = Color(0xFFadadad);

//Keys
// const kKeyBackgroundCyan = Color(0xFF377f86);
const kLightCardColor = Color(0xFFffffff);
// const kKeyShadowCyan = Color(0xFF1b5f65);
const kKeyOrangeBG = Color(0xFFca5502);
// const kKeyOrangeShadow = Color(0xFF893901);
// const kLightGrayishYellow = Color(0xFFe5e4e1);
// const kDarkGrayishOrange = Color(0xFFa69d91);

//Text
const kDarkGrayishYellow = Color(0xFF35352c);
const kLightBoldText = Color(0xFF212121);
const kLightNormalText = Color(0xFF656565);

const kSuccessGreen = Color(0xFF4CAF50);
const kLogoutRed = Color(0xFFFF7171);






//Vertical SizeBox
verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

//Vertical SizeBox
horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}



defaultSnackBar({required BuildContext context,required String message,required bool isSuccess,
  required int duration,
  required bool isLow}) =>

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content: Text(message, textAlign: TextAlign.center),
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isSuccess ? kPrimaryColor : kLogoutRed,
        margin: EdgeInsets.only(
          bottom: isLow ? 20 : kBottomNavigationBarHeight + 25,
          left: 20,
          right: 20,
        ),
      ),
    );






settingsTextStyle(){
  return const TextStyle(fontSize: 14,fontWeight: FontWeight.w700);
}








