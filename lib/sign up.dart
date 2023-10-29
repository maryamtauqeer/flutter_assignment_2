import 'package:flutter/material.dart';
import 'package:flutter_assignment_2/home.dart';
import 'package:flutter_assignment_2/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  bool _isVisible1 = false;
  bool _isVisible2 = false;

  bool isEmailTooLong = false;

  void validateEmail(String value) {
    setState(() {
      isEmailTooLong = value.length > 50;
    });
  }

  bool isPasswordTooLong1 = false;
  bool isPasswordTooLong2 = false;

  void validatePassword1(String value) {
    setState(() {
      isPasswordTooLong1 = value.length > 20;
    });
  }

  void validatePassword2(String value) {
    setState(() {
      isPasswordTooLong2 = value.length > 20;
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
              Image.asset('android/assets/asset2.jpg'),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _passwordController1,
                            obscureText: !_isVisible1,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: Theme.of(context).hintColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: isPasswordTooLong1
                                      ? Colors.red
                                      : Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isVisible1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isVisible1 = !_isVisible1;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              validatePassword1(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 25.0),
                        Expanded(
                          child: TextField(
                            controller: _passwordController2,
                            obscureText: !_isVisible2,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle:
                                  TextStyle(color: Theme.of(context).hintColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: isPasswordTooLong2
                                      ? Colors.red
                                      : Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isVisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isVisible2 = !_isVisible2;
                                  });
                                },
                              ),
                            ),
                            onChanged: (value) {
                              validatePassword2(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isPasswordTooLong1 || isPasswordTooLong2)
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
                          if (!(isEmailTooLong ||
                              isPasswordTooLong1 ||
                              isPasswordTooLong2)) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Create account',
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
                          'Have an account?',
                          style: TextStyle(
                            color: Color(0xFF765DC2),
                            fontSize: 17.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF765DC2),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
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
