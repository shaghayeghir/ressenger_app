
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ressengaer_app/constants.dart';

import '../widgets/my_bottom_navigation_bar.dart';

class ProFileScreen extends StatelessWidget {
  const ProFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: mYBottomNavigationBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const CircleAvatar(
                backgroundColor: kLightPink,
                child: Center(
                  child: Text('x',style: TextStyle(fontSize: 30),),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Stack(
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 40,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: kLightPink,
                          child: Icon(Icons.edit,size: 15,),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Ron Cribb',style: TextStyle(color: kLightPink,fontSize: 20,fontWeight: FontWeight.w900,fontFamily: 'Mont'),),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Arlington Estate',style: TextStyle(color: kDarkBlue,fontFamily: 'Mont',fontWeight: FontWeight.w900),),
                        Text('Number : 50',style: TextStyle(color: kDarkBlue,fontFamily: 'Mont',fontWeight: FontWeight.w900),),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.briefcase,
                        color: kLightPink,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('My Posts',style: TextStyle(color: kLightPink,fontFamily: 'Mont',fontWeight: FontWeight.w900,fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.briefcase,
                        color: kLightPink,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Settings',style: TextStyle(color: kLightPink,fontFamily: 'Mont',fontWeight: FontWeight.w900,fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.briefcase,
                        color: kLightPink,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Legal',style: TextStyle(color: kLightPink,fontFamily: 'Mont',fontWeight: FontWeight.w900,fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.briefcase,
                        color: kLightPink,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Logout',style: TextStyle(color: kLightPink,fontFamily: 'Mont',fontWeight: FontWeight.w900,fontSize: 15),),
                    ],
                  ),
                  const SizedBox(height: 20,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
