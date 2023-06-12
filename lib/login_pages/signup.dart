import 'package:flutter/material.dart';
import 'package:user_interface/login_pages/signup2.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Define variables to store user input
  String firstName = '';
  String lastName = '';
  late int phone;
  String gender = '';
  String state = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
                onChanged: (value) {
                  setState(() {
                    firstName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
                onChanged: (value) {
                  setState(() {
                    lastName = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone no.',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    phone = int.tryParse(value)!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _showGenderSelectionDialog();
                },
                child: IgnorePointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    controller: TextEditingController(text: gender),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _showStateSelectionDialog();
                },
                child: IgnorePointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                    controller: TextEditingController(text: state),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform validation and handle next button press
                  if (_validateFields()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup2Page()), // Navigate to SignupPage2
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGenderSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Male'),
                onTap: () {
                  setState(() {
                    gender = 'Male';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Female'),
                onTap: () {
                  setState(() {
                    gender = 'Female';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Other'),
                onTap: () {
                  setState(() {
                    gender = 'Other';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showStateSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select State'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('State 1'),
                onTap: () {
                  setState(() {
                    state = 'State 1';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('State 2'),
                onTap: () {
                  setState(() {
                    state = 'State 2';
                  });
                  Navigator.pop(context);
                },
              ),
              // Add remaining states here
            ],
          ),
        );
      },
    );
  }

  bool _validateFields() {
    // Perform validation on the required fields
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        phone == null ||
        gender.isEmpty ||
        state.isEmpty ||
        address.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill in all the required fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
