
import 'package:flutter/material.dart';

import '../../constants.dart';



///Dark theme
ThemeData darkTheme =
ThemeData(

  scaffoldBackgroundColor: kDarkScaffold,

  //For Keys
  disabledColor: kLightGrayishOrange,
  dividerColor:kGrayishOrange ,
  primaryIconTheme: const IconThemeData(color: kPrimaryColor),




  cardTheme: const CardTheme(color: kDarkCard),
  iconTheme: IconThemeData(color: kPrimaryColor),
  fontFamily: 'Poppins',

    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kGrayishOrange.withOpacity(0.5)), // Specify your color here
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor), // Specify your focused color here
        ),
        disabledBorder:const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.pink), // Specify your focused color here
        ) ,
        filled: false,
        fillColor: Colors.lightBlue[50],
        outlineBorder: const BorderSide(color: kPrimaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),

      // Customization for input text and label text colors
      labelStyle: const TextStyle(
        color: kGrayishOrange, // Default label color
      ),
      hintStyle: const TextStyle(
        color: kGrayishOrange, // Default hint text color
      ),


      floatingLabelStyle: const TextStyle(
        color: kPrimaryLight, // Floating label color when text field is focused
      ),



      // Input field text customization
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),

    ),
  textTheme:  const TextTheme(

    bodyMedium: TextStyle(
        color: kWhiteText,
        fontSize: 12,
       // fontWeight: FontWeight.bold

    ),


  ),

    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll<Color>(kScreenGray),
    ),

    listTileTheme: const ListTileThemeData(
        textColor: kScreenGray
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll<Color>(kPrimaryColor),
            textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)

            ))
        )

    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
    ),


    switchTheme: SwitchThemeData(
        thumbColor:  MaterialStateProperty.all(kPrimaryColor),
        trackColor:  MaterialStateProperty.all(kPrimaryLight),),

    appBarTheme: const AppBarTheme(
        backgroundColor: kDarkAppbar,
        elevation: 0.0,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)

    ), bottomAppBarTheme: const BottomAppBarTheme(color: kScreenDark)

);

///Light theme
ThemeData lightTheme =
ThemeData(

  scaffoldBackgroundColor: kScaffoldColor,


  //For Keys
  disabledColor: kLightDisabledColor,
  dividerColor:kLightNormalText ,


  //For equal sign
  // highlightColor: kKeyOrangeBG,
  // canvasColor: kKeyOrangeShadow,

  //For Del and reset buttons
 // focusColor: kKeyBackgroundCyan,
  cardTheme: const CardTheme(color: kLightCardColor),
  fontFamily: 'Poppins',


  textTheme:  const TextTheme(

    bodyMedium: TextStyle(
        color: kDarkGrayishYellow,
        fontSize: 12,
        //fontWeight: FontWeight.bold

    ),

  ),
  inputDecorationTheme: const InputDecorationTheme(
    // Sets the default underline color for all `TextField`s
    // (replace `Colors.green` with your desired color)
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryLight),
    ),
    // Sets the default underline color when focused for all `TextField`s
    // (replace `Colors.red` with your desired color)
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
  ),

  checkboxTheme: const CheckboxThemeData(
    fillColor: MaterialStatePropertyAll<Color>(kToggleDark),
  ),

  listTileTheme: const ListTileThemeData(
    textColor: kToggleDark
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll<Color>(kPrimaryColor),
      textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)

      ))
    )

  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),

    switchTheme: SwitchThemeData(
    thumbColor:  MaterialStateProperty.all(kPrimaryColor),
    trackColor:  MaterialStateProperty.all(kPrimaryLight),


  ),



  appBarTheme: const AppBarTheme(
    backgroundColor: kLightAppbar,
    elevation: 0.0,
    titleTextStyle: TextStyle(color: kLightBoldText, fontSize: 20, fontWeight: FontWeight.bold)

  )


);

