import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



const kMyPink = Color(0XFFfe0184);



kNavigator(context, page) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => page),
  );
}

kNavigatorBack(context) {
  Navigator.of(context).pop();
}
