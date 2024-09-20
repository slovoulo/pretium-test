import 'package:flutter/material.dart';
import 'package:pretiumtest/constants.dart';
import 'package:pretiumtest/dioServices/dioPostService.dart';
import 'package:pretiumtest/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Method to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  // Method to save login state in shared preferences
  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Simulate login validation (replace with real validation logic)
    if (email.isNotEmpty && password.isNotEmpty) {
      if(_emailController.text.toLowerCase()!="derrick@pretium.africa"){
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Invalid Email.')));
      }else if(_passwordController.text!="123456"){
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Invalid Password.')));
      }else{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await DioPostService().pretiumLogin( body: {
          "email": _emailController.text,
          "password": _passwordController.text
        });

        await prefs.setBool('isLoggedIn', true); // Save login state


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainNavigationPage()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter email and password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Pretium Test Results",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),SizedBox(height: 16),
            Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: kPrimaryColor),height:80,width:80,child: Image.asset("assets/images/logo.png")),
            SizedBox(height: 16),TextField(style: TextStyle(color: kGrayishOrange),
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email. (hint: Test Email)',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible, // Show/hide password
              decoration: InputDecoration(
                labelText: 'Email. (hint: Test Password)',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility, // Toggle password visibility
                ),
              ),
            ),
            SizedBox(height: 16),
            primaryButton2(
               context: context, onPressedFunction: () { _login(); }, buttonText: 'Login', backgroundColor: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}


