import 'package:caster1/core/ui_components/componants.dart';
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

              Image.asset('assets/images/temp2.png',
                  width:  context.screenWidth  ,
                  height: context.screenHeight * 0.6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Text(textAlign: TextAlign.center,
                        "Find your preferences models",
                        style: TextStyle(color: black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                    SizedBox(height: context.screenHeight * 0.01,),
                    Text(textAlign: TextAlign.center,
                        "Join us with other millions of people and find your best matches",
                        style: TextStyle(color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    SizedBox(height: context.screenHeight * 0.04,),
                    Row(
                      children: [
                        ContinueButton(
                            buttonText: "Continue",
                            nextPage: Onboarding3()),
                      ],
                    )             ,
                    SizedBox(height: context.screenHeight * 0.02,),
                    Row(
                      children: [
                        SignInButton(),
                      ],
                    )
                  ],
                ),
              ),

            ],),
        ));
  }
}
