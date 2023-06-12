import 'package:flutter/material.dart';
import 'package:user_interface/login_pages/forgot.dart';
import 'package:user_interface/login_pages/signup.dart';
import 'package:user_interface/primarypages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Interface',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Testing of User Interface'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email = '';
  String _password = '';
  bool _passwordVisible = false;
  bool _isLoading = false;

  void _login() {
    // Perform login logic here
    print('Email: $_email');
    print('Password: $_password');

    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulating a delay for demonstration purposes
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Stop loading
      });

      // Navigate to Homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()), // Update here
      );
    });
  }

  void _goToSignup() {
    // Navigate to Signup page
    // Implement your signup logic here
    print('Go to Signup page');
    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulating a delay for demonstration purposes
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Stop loading
      });

      // Navigate to Homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupPage()), // Update here
      );
    });
  }

  void _goToForgetPassword() {
    // Navigate to Forget Password page
    // Implement your forget password logic here
    print('Go to Forget Password page');
    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulating a delay for demonstration purposes
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Stop loading
      });

      // Navigate to Homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPage()), // Update here
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius here
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 38.0,
                  ),
                ),
                SizedBox(height: 50.0),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                    labelText: 'Enter email',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 30.0),
                TextField(
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    labelText: 'Enter password',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? CircularProgressIndicator() // Show loading indicator
                      : Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: _goToSignup,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "Don't remember your Password?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: _goToForgetPassword,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

