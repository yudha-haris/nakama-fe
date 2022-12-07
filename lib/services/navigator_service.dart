import 'package:flutter/material.dart';

class NavigatorService {
  static void push(BuildContext context, {required Widget route}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));
  }

  static void pushReplacement(BuildContext context, {required Widget route}) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
  }
}