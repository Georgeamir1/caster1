import 'package:caster1/Email.dart';
import 'package:caster1/componants.dart';
import 'package:caster1/regBirthdate.dart';
import 'package:caster1/regName.dart';
import 'package:caster1/regPhone.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';
class acctype extends StatefulWidget {
  @override
  _acctypeState createState() => _acctypeState();
}
final birthdatekey = GlobalKey<FormState>();
class _acctypeState extends State<acctype> {
  bool model=false;
  bool agency=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Center(
                    child: Text(
                      "Which one are you?",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    SizedBox(
                      width: 155,
                      height: 200,
                      child:
                      Container(decoration: BoxDecoration(
                        border: Border.all(color:  model ? Colors.black : Colors.transparent) ,
                        borderRadius: BorderRadius.circular(24),),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              model=!model;
                              agency= false;

                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Secondary),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Image.asset('assets/images/model.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                    "Model",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                              )                          ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    SizedBox(
                      width: 155,
                      height: 200,
                      child:
                      Container(decoration: BoxDecoration(
                        border: Border.all(color:  agency ? Primary :Colors.transparent ) ,
                        borderRadius: BorderRadius.circular(24),),
                        child: ElevatedButton(
                          onPressed: () { setState(() {
                            model=false;
                            agency=!agency;

                          });},
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/agency.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                    "Female",
                                    style: TextStyle(color: Primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                              )                          ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0,vertical: 42),
                  child: Text(textAlign: TextAlign.center,
                      "To give you a customize experience we need to know who are you",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                ),

                SizedBox(height: 91,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
                  child: Row(
                    children: [
                      ContinueButton(
                        buttonText: 'Continue',
                        nextPage: regemail(), // Replace NextPage with the actual next page widget
                      ),

                    ],
                  ),
                ),
                Spacer(),
              ],
            )
        ));

  }
}
