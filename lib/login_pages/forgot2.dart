import 'package:flutter/material.dart';
import 'package:user_interface/primarypages/homepage.dart';
import 'package:user_interface/main.dart';

class Forgot2Page extends StatefulWidget {
  @override
  _Forgot2PageState createState() => _Forgot2PageState();
}

class _Forgot2PageState extends State<Forgot2Page> {
  String newPassword = '';
  String confirmNewPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
              onChanged: (value) {
                setState(() {
                  newPassword = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
              ),
              onChanged: (value) {
                setState(() {
                  confirmNewPassword = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle password reset logic
              },
              child: Text('Reset Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Go to Login Page'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
