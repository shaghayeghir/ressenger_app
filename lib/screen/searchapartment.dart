import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ressengaer_app/AddBuilding/add_building.dart';
import 'package:ressengaer_app/screen/searchapartment.dart';

import '../constants.dart';
import '../provider/ApiService.dart';

class SearchApartment extends StatelessWidget {
  var previusScreen;

  SearchApartment({required this.previusScreen}) ;

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, value, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: context.read<ApiService>().getApartment(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('hasError');
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(),
                );
              }

              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.1),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'No Contact...',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  );
                }
                // return Text('data');

                return SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Image(
                            image: AssetImage('assets/images/screen6.fw.png'),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Select Residence',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: kLightPink,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 40,
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, index) {
                                return Column(
                                  children: [
                                    RawMaterialButton(
                                      onPressed: () {
                                     value.setApartment( snapshot.data!.docs[index]
                                         .get('name'));

                                     value.setApartmentId( snapshot.data!.docs[index]
                                         .get('id'));

                                          context.read<ApiService>().updateApartment(
                                            context,
                                          );



                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                              snapshot.data!.docs[index]
                                                  .get('name'),
                                              style: const TextStyle(
                                                  color: kLightPink,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    const Divider(color: kLightPink, thickness: 2),
                                  ],
                                );
                              },
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Center(
                child: Container(),
              );
            });
      },
    );
  }
}
