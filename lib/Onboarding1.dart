import 'package:caster1/componants.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'Onboarding2.dart';

class Onboarding1 extends StatefulWidget {


  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 52,),
            Image.asset('assets/images/temp1.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Text(textAlign: TextAlign.center,
                      "Make friends with the people like you",
                      style: TextStyle(color: black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  SizedBox(height: 16,),
                  Text(textAlign: TextAlign.center,
                      "Interact with people with the same \n interest like you",
                      style: TextStyle(color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  SizedBox(height: 32,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Primary, // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32), // Set the border radius
                            ),
                            fixedSize: Size.fromHeight(56), // Set the height of the button
                          ),
                          onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Onboarding2()),);},
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Secondary, // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32), // Set the border radius
                            ),
                            fixedSize: Size.fromHeight(56), // Set the height of the button
                          ),
                          onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),);},
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 48,),
                ],
              ),
            ),

          ],),
      ));
  }
}
