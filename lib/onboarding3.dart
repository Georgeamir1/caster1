import 'package:caster1/core/ui_components/componants.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'accType.dart';

class Onboarding3 extends StatefulWidget {


  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: SafeArea(
          child: Column(
            children: [

              Image.asset('assets/images/temp3.png',
                  width:  context.screenWidth * 0.8 ,
                  height: context.screenHeight * 0.5),
              SizedBox(height: context.screenHeight * 0.076),
              Text(textAlign: TextAlign.center,
                  "Let’s meeting new people around you",
                  style: TextStyle(color: black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                                        SizedBox(height: context.screenHeight * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Primary, // Set the background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32), // Set the border radius
                              ),
                              fixedSize: Size.fromHeight(context.screenHeight * 0.06,), // Set the height of the button
                            ),
                            onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),);},
                            child: Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.white,maxRadius: context.screenHeight * 0.025,child:  Icon(color: Primary,Icons.phone_in_talk_sharp,), ),
                                Spacer(),
                                Text(
                                  "Login with Phone",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child:
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Secondary, // Set the background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32), // Set the border radius
                              ),
                              fixedSize: Size.fromHeight(context.screenHeight * 0.06,), // Set the height of the button
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.white,maxRadius: context.screenHeight * 0.025,child: Image.asset('assets/images/google.png',height: 30,) ),
                                Spacer(),
                                Text(
                                  "Login with Google",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.04),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(textAlign: TextAlign.center,
                            "Don’t have an account?",
                            style: TextStyle(color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        TextButton(
                            onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => acctype()),);

                        },
                            child: Text('Sign up',style: TextStyle(color: Secondary,
                          fontSize:14,
                          fontWeight: FontWeight.w400,))
                        )],
                    ),
                    SizedBox(height: context.screenHeight * 0.015),
                    
                  ],
                ),
              ),

            ],),
        ));
  }
}
