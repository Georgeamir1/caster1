import 'package:caster1/core/ui_components/componants.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Onboarding2.dart';
import 'core/functions/get_device_type.dart';
import 'core/enums/device_type.dart';
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
            SizedBox(height: context.screenHeight * 0.03,),
            Image.asset(
              'assets/images/temp1.png',
              width:  context.screenWidth ,
              height: context.screenHeight * 0.5
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children:
                [
                  SizedBox(height: context.screenHeight * 0.05,),
                  Text(textAlign: TextAlign.center,
                      "Make friends with the people like you",
                      style: TextStyle(color: black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Text(textAlign: TextAlign.center,
                      "Interact with people with the same \n interest like you",
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
                        nextPage: Onboarding2()),
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
