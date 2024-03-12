import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindfulmoments/pages/authentication.dart';
import 'package:mindfulmoments/theme/colors.dart';

class SignUpAndLoginPage extends StatefulWidget {
  const SignUpAndLoginPage({super.key});

  @override
  State<SignUpAndLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpAndLoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

   final TextEditingController _controllerEmail = TextEditingController();
   final TextEditingController _controllerPassword = TextEditingController();

   Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInwithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
   }

   Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserwithEmailAndPassword(
        email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
   }

   Widget _title(){
    return const Text('Sign Up');
   }

   Widget _entryField(
    String title,
    TextEditingController controller,
   ){
    String hintText = title == 'Email Address' ? 'Enter Email Address' : 'Enter Password';
    String labelText = title == 'Email Address' ? 'Email Address' : 'Password';
    
    return Column(
      children: [
         Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 25),
             child: Text(
              labelText,
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
            ),
           
          
            
          ],
        ),
        TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: AppColors.whiteColor,
                filled: true,
                contentPadding: const EdgeInsets.all(22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              
            ),
      ],
    );
   }

   Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'WTF Bro? $errorMessage');
   }

   Widget _submitButton(){
    return Container(
      height: 60,
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Sign In' : 'Sign Up')),
      );
  
   }

   Widget _loginOrRegisterButton(){
    return RichText(text: TextSpan(
      children: [
        const TextSpan(
          text: "Don't have an account?",
          style: TextStyle(color: AppColors.blackColor, fontSize: 15)
        ),
        TextSpan(text: isLogin ? 'Sign Up' : 'Login',
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 15,
          fontWeight: FontWeight.w700
        ),
        recognizer: TapGestureRecognizer()
        ..onTap = (){
          setState(() {
            isLogin = !isLogin;
          });
        }
        )
      ]
    ));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            _entryField('Email Address', _controllerEmail),
            const SizedBox(height: 20,),
            _entryField('Password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
           ],
        ),
      ),
    );
  }
}
