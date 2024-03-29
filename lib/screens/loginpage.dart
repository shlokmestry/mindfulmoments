import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindfulmoments/pages/authentication.dart';
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

  String? errorMessage = '';
  bool isLogin = true;
  bool isRegistering = false;

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
            Padding(padding: const EdgeInsets.only(left: 10),
             child: Text(
              labelText,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
            ),
           
          
            
          ],
        ),
        TextFormField(
              controller: controller,
              obscureText: title == 'Password' ? _isObscured : false,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: AppColors.whiteColor,
                filled: true,
                contentPadding: const EdgeInsets.all(22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: title == 'Password' ? IconButton(
                  onPressed: (){
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  }, icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blackColor,
                  ),

                  ) : null,
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
        child: Text(isLogin ? 'SignIn' : 'SignUp',
        style: TextStyle(color: AppColors.whiteColor),)),
      );
  
   }

   Widget _loginOrRegisterButton(){
    return RichText(text: TextSpan(
      children: [
         TextSpan(
          text: isRegistering ? "Already have an account? " : "Don't have an account? ",
          style: TextStyle(color: AppColors.blackColor, fontSize: 15)
        ),
        TextSpan(text: isLogin ? 'SignUp' : 'SignIn',
        style: const TextStyle(
          color: AppColors.blackColor,
          fontSize: 15,
          fontWeight: FontWeight.w700
        ),
        recognizer: TapGestureRecognizer()
        ..onTap = (){
          setState(() {
            isLogin = !isLogin;
            isRegistering = !isRegistering;
          });
        }
        )
      ]
    ));
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
          
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              SizedBox(
                width: 390,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _entryField('Email Address', _controllerEmail),
                    const SizedBox(height: 20,),
                    _entryField('Password', _controllerPassword),
                    _errorMessage(),
                    _submitButton(),
                    _loginOrRegisterButton()
                  ],
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
