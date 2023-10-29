import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/home.dart';
import 'package:flutter_assignment_2/sign%20up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isVisible = false;

  bool isEmailTooLong = false;

  void validateEmail(String value) {
    setState(() {
      isEmailTooLong = value.length > 50;
    });
  }

  bool isPasswordTooLong = false;

  void validatePassword(String value) {
    setState(() {
      isPasswordTooLong = value.length > 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('android/assets/asset1.jpg'),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF765DC2),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: isEmailTooLong ? Colors.red : Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        validateEmail(value);
                      },
                    ),
                    if (isEmailTooLong)
                      const Text(
                        'Email can only be 50 characters or less',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 25.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Theme.of(context).hintColor),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color:
                                isPasswordTooLong ? Colors.red : Colors.black,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        validatePassword(value);
                      },
                    ),
                    if (isPasswordTooLong)
                      const Text(
                        'Password can only be 20 characters or less',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: double.infinity,
                      height: 55.0,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF765DC2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!(isEmailTooLong || isPasswordTooLong)) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Color(0xFF765DC2),
                            fontSize: 17.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignupPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF765DC2),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        //no functionality for now
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF765DC2),
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
