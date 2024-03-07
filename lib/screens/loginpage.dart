import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isObscured;

  @override
  void initState() {
    super.initState();

    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 15)),
                Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                Padding(padding: EdgeInsets.only(right: 125)),
                Text(
                  'Login',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(children: [
              Padding(padding: EdgeInsets.only(left: 25)),
              Text(
                'Email Address',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              SizedBox(
                width: 390,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email Address',
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        contentPadding: const EdgeInsets.all(22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const Row(children: [
              Padding(padding: EdgeInsets.only(left: 25)),
              Text(
                'Password',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Padding(padding: EdgeInsets.only(left: 20)),
              SizedBox(
                width: 390,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            icon: _isObscured
                                ? const Icon(
                                    Icons.visibility,
                                    color: AppColors.blackColor,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: AppColors.blackColor,
                                  )),
                        hintText: 'Enter Password',
                        fillColor: AppColors.whiteColor,
                        filled: true,
                        contentPadding: const EdgeInsets.all(22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Container(
              height: 60,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Login'),
                  onPressed: () {}),
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: AppColors.blackColor, fontSize: 15)),
              TextSpan(
                  text: 'Sign Up',
                  style: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()..onTap = () {})
            ]))
          ],
        ),
      ),
    );
  }
}
