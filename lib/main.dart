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



  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => ApiService(),),

    ],
      child: MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen()
        //
      ),);
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loggedIn = false;
  void initState() {
    if (auth.currentUser != null) {
      loggedIn = true;
    } else {
      loggedIn = false;
    }
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => (loggedIn)?Notices(): LoginOrSignup(),),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMyPink,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.1,
            child: Image.asset('assets/images/ressengerlogo2.png')),
      )
    );
  }
}



