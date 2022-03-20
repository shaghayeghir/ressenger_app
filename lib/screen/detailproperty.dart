import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ressengaer_app/Authentication/confirm.dart';
import 'package:ressengaer_app/Authentication/login.dart';
import 'package:ressengaer_app/Authentication/sign_up.dart';
import 'package:ressengaer_app/constants.dart';
import 'package:ressengaer_app/screen/post_property.dart';
import 'package:ressengaer_app/screen/property_chat_dialog.dart';
import 'package:ressengaer_app/widgets/button.dart';
import 'package:ressengaer_app/widgets/text_fileds.dart';

import '../Utils/custom_snackbar.dart';
import '../provider/ApiService.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import 'chat_dialog.dart';

class DetailProperty extends StatelessWidget implements ApiStatusLogin {

  var documentId;

  DetailProperty({required this.documentId});
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        body: SafeArea(

            child: Consumer<ApiService>(
                builder: (context, value, child) {
                  value.apiListener(this);
                  return SafeArea(child:Container(

                    child: Scaffold(
                      bottomNavigationBar: SizedBox(
                          height: 137,
                          child:   FutureBuilder<
                              DocumentSnapshot>(
                            future:value.getPropertyAdsDetails( documentId),
                            builder: (BuildContext
                            context,
                                AsyncSnapshot<
                                    DocumentSnapshot>
                                snapshot) {
                              if (snapshot
                                  .hasError) {
                                return const Text(
                                    "Something went wrong");
                              }

                              if (snapshot
                                  .hasData &&
                                  !snapshot
                                      .data!
                                      .exists) {
                                return const Text(
                                    "Document does not exist");
                              }

                              if (snapshot
                                  .connectionState ==
                                  ConnectionState
                                      .done) {
                                Map<String,
                                    dynamic> data = snapshot
                                    .data!
                                    .data()
                                as Map<
                                    String,
                                    dynamic>;
                                return Column(
                                  children: [
                                    const Divider(thickness: 3),
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          child: RichText(
                                            text:  TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                color: kLightPink,
                                              ),
                                              children: <TextSpan>[
                                                const TextSpan(text: 'Posted by:\n'),
                                                TextSpan(
                                                    text: '${data['senderName']} ,\n',
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold, color: kDarkBlue)),
                                                TextSpan(
                                                    text: data['time'],
                                                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        RawMaterialButton(
                                          onPressed: () {
                                            showDialog<
                                                String>(
                                                context:
                                                context,
                                                builder:
                                                    (BuildContext
                                                context) {
                                                  return Dialog(
                                                    child: PropertyChatDialog( documentId: documentId,),
                                                  );
                                                });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: kDarkBlue,
                                                borderRadius: BorderRadius.circular(20)),
                                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                                            child: const Text(
                                              'Send Message',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    mYBottomNavigationBar(context),
                                  ],
                                );
                              }

                              return const Center(
                                child: Text(
                                  "loading...",style: TextStyle(color: kMyPink,fontSize: 20,fontFamily: 'Mont'),),
                              );
                            },
                          )
                      ),
                      body:  FutureBuilder<
                          DocumentSnapshot>(
                        future: value.getPropertyAdsDetails(documentId),
                        builder: (BuildContext
                        context,
                            AsyncSnapshot<
                                DocumentSnapshot>
                            snapshot) {
                          if (snapshot
                              .hasError) {
                            return const Text(
                                "Something went wrong");
                          }

                          if (snapshot
                              .hasData &&
                              !snapshot
                                  .data!
                                  .exists) {
                            return const Text(
                                "Document does not exist");
                          }

                          if (snapshot
                              .connectionState ==
                              ConnectionState
                                  .done) {
                            Map<String,
                                dynamic> data = snapshot
                                .data!
                                .data()
                            as Map<
                                String,
                                dynamic>;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          kNavigatorBack(context);
                                        },
                                        icon: const Icon(
                                          Icons.wifi_protected_setup,
                                          color: kMyPink,
                                          size: 40,
                                        ),),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Property',
                                        style: TextStyle(
                                            color: kLightPink,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      RawMaterialButton(
                                        onPressed: () {  kNavigator(context, PostProperty()); },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: kDarkBlue,
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                          child: const Center(
                                              child: Text(
                                                'Post',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Image(
                                        image: AssetImage('assets/images/wicon.png'),
                                        width: 50,
                                        height: 50,
                                        color: kLightPink,
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.grey, thickness: 2),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Image(
                                    image: AssetImage('assets/images/banner.png'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: kLightPink),
                                      ),

                                      SizedBox(height: 5,),
                                      Text(
                                        '\R'+
                                            data['price'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kLightPink,
                                            fontSize: 15),
                                      ),
                                      SizedBox(height: 30,),
                                      Container(
                                        child:( data['image'].toString().length>2)
                                            ?Center(child: Image.network(data['image']))
                                            :Center(
                                          child: Container(
                                              width: MediaQuery.of(context).size.width*0.8,
                                              height: MediaQuery.of(context).size.height*0.4,
                                              child: Image.asset('assets/images/wicon2.png')),
                                        )
                                        ,),
                                      SizedBox(height: 30,),
                                      Text(
                                        data['description'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kLightPink,
                                            fontSize: 15),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            );
                          }

                          return const Center(
                            child: Text(
                              "loading...",style: TextStyle(color: kMyPink,fontSize: 20,fontFamily: 'Mont'),),
                          );
                        },
                      ),
                    ),
                  ));
                }))
    );
  }

  @override
  void accountAvailable() {

  }

  @override
  void error() {
    ModeSnackBar.show(context, 'something go wrong', SnackBarMode.error);
  }

  @override
  void inputEmpty() {
    ModeSnackBar.show(context, 'username or password empty', SnackBarMode.warning);
  }

  @override
  void inputWrong() {
    ModeSnackBar.show(context, 'username or password incorrect', SnackBarMode.warning);
  }

  @override
  void login(){
    //Box b = Hive.box('vet');
    //b.put('vet', false);
    kNavigatorBack(context);
    kNavigator(context, Confirm());
  }

  @override
  void passwordWeak() {
    ModeSnackBar.show(context, 'password is weak', SnackBarMode.warning);
  }
}
