import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfulmoments/screens/loginpage.dart';
import 'package:mindfulmoments/screens/signuppage.dart';
import 'package:mindfulmoments/theme/buttons.dart';
import 'package:mindfulmoments/theme/colors.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Image.asset('assets/images/onboardingimg.jpg'),
            const SizedBox(height: 30,),
            Text('Start keeping\ntrack of your\n        life',
            style: GoogleFonts.nunitoSans(
              fontSize:30,
              fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpPage()));
                }, 
                child: const Text('Sign Up',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16
                ),)
                ),
                SizedBox(height: 20,),
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
                  recognizer: TapGestureRecognizer()..onTap = () {Navigator.push(context, MaterialPageRoute(builder: (Context)=> LoginPage()));})
            ]))
          ],
        ),
        
      ),
    );
  }
}