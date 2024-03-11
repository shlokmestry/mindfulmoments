import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _isObscured;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
                const Padding(padding: EdgeInsets.only(right: 100)),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 25)),
                Text(
                  'First Name',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Padding(padding: EdgeInsets.only(right: 90)),
                Text(
                  'Last Name',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 20)),
                SizedBox(
                  width: 185,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'First Name',
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
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    SizedBox(
                      width: 185,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                fillColor: AppColors.whiteColor,
                                filled: true,
                                contentPadding: const EdgeInsets.all(22),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpPage(),
                        ));
                  }),
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: AppColors.blackColor, fontSize: 15)),
              TextSpan(
                  text: 'Log In',
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
