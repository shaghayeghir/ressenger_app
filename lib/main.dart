import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ressengaer_app/Authentication/login_signup.dart';
import 'package:ressengaer_app/Authentication/test2.dart';
import 'package:ressengaer_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:ressengaer_app/provider/ApiService.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loggedIn = false;


  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      loggedIn = true;
    } else {
      loggedIn = false;
    }
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => ApiService(),),

    ],
      child: MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:(loggedIn)?Notices(): LoginOrSignup(),
      ),);
  }
}



