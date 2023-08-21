import 'package:caster1/componants.dart';
import 'package:caster1/regPhone.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 60),
                child: Image.asset('assets/images/temp3.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Text(textAlign: TextAlign.center,
                        "Let’s meeting new people around you",
                        style: TextStyle(color: black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
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
                              MaterialPageRoute(builder: (context) => login()),);},
                            child: Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.white,child:  Icon(color: Primary,Icons.phone_in_talk_sharp), ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
                                  child: Text(
                                    "Login with Phone",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
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
                            onPressed: () {},
                            child: Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.white,child: Image.asset('assets/images/google.png',height: 30,) ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
                                  child: Text(
                                    "Login with Google",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 32,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(textAlign: TextAlign.center,
                            "Don’t have an account?",
                            style: TextStyle(color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => regPhone()),);

                        }, child: Text('Sign up',style: TextStyle(color: Secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,))
                        )],
                    ),


                  ],
                ),
              ),

            ],),
        ));
  }
}
