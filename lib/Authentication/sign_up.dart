import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ressengaer_app/Authentication/confirm.dart';
import 'package:ressengaer_app/Authentication/login.dart';
import 'package:ressengaer_app/constants.dart';
import 'package:ressengaer_app/widgets/button.dart';
import 'package:ressengaer_app/widgets/text_fileds.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: kMyPink,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('assets/images/ressengerlogo2.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                MyTextFiled(
                  text: '               full name',
                  icon: Icons.supervisor_account_sharp,
                  controller: null,
                ),
                MyTextFiled(
                  text: '            email address',
                  icon: Icons.email,
                  controller: null,
                ),
                MyTextFiled(
                  text: '                password',
                  icon: Icons.lock,
                  controller: null,
                ),

                MyTextFiled(
                  text: '           confirm Password',
                  icon: Icons.lock,
                  controller: null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  'By signing up you are agreeing to \n Reesenger\'s Terms & Conditions ',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.023,
                ),
                roundedButton(
                    kMyPink, context, 0.08, 0.63, 'Sign Up', Colors.white, () {
                  //value.signUpUser();
                 // kNavigator(context, Confirm());
                }),



                Center(
                  child: Container(
                    margin: EdgeInsets.all(45),
                    child:  TextButton(onPressed: () {
                      kNavigator(context, Login());
                    },
                      child: const Text(  'Already have an account ?\n Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,),

                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
