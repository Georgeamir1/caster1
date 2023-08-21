import 'package:caster1/componants.dart';
import 'package:caster1/onboarding3.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class Onboarding2 extends StatefulWidget {


  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height:100,),
              Image.asset('assets/images/temp2.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Text(textAlign: TextAlign.center,
                        "Find your preferences models",
                        style: TextStyle(color: black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                    SizedBox(height: 16,),
                    Text(textAlign: TextAlign.center,
                        "Join us with other millions of people and find your best matches",
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
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Onboarding3()),);
                              },
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
