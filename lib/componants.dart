import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String name1 = 'John';
int age = 30;
double height = 1.75;
Color black = const Color(0xff17182a);
Color Primary = const Color(0xFF24377D);
Color Secondary = const Color(0xff91b6ee);
Color Secondary2 = const Color(0xffcce6ff);
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 80,
        width: 80,
        child: IconButton(
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 2.0),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
              radius: 20.0,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
  }}
Map<String, dynamic> data = {
  'name': name1,
  'age': age,
  'height': height,
};
