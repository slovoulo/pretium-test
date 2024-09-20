import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';
import 'dioServices/dioPostService.dart';


profileItem({required String key,required String value}){
  return Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$key: ',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold, // Bold for label
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal, // Normal for value
        ),
      ),
    ],
  );
}
primaryButton2(
    {required BuildContext context,
      required VoidCallback onPressedFunction,
      required String buttonText,required Color backgroundColor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.27,
    child: ElevatedButton(
        onPressed: onPressedFunction,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: backgroundColor, // Text color
        ),
        child: Text(
          buttonText,
          style:  const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black),
        )),
  );
}

Future<void> editCountryDialog(
    {required BuildContext context, required int countryID }) async {
  final TextEditingController _controller = TextEditingController();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kToggleLight,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Edit Currency',
            labelStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(),
          ),
        ),
        actions: <Widget>[
          Row(children: [
            primaryButton2(context: context, onPressedFunction: (){Navigator.of(context).pop();}, buttonText: "Cancel", backgroundColor: kDarkBold),horizontalSpace(10),primaryButton2(context: context, onPressedFunction: ()async{
              if(_controller.text.isEmpty){
                Fluttertoast.showToast(
                  msg: "Please enter a value",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor:Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }else{
                await DioPostService().updateCountry({"country_id": countryID,
                  "data":{
                    "currency": _controller.text,
                  }
                });
                Fluttertoast.showToast(
                  msg: "Success: Your new currency will be reviewed",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor:Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            }, buttonText: "Submit", backgroundColor: kPrimaryColor),
          ],)
        ],
      );
    },
  );
}