import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regGender.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

class birthdateReg extends StatefulWidget {

  @override
  _birthdateRegState createState() => _birthdateRegState();
}
final birthdatekey = GlobalKey<FormState>();
DateTime? birthdate;

class _birthdateRegState extends State<birthdateReg> {
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "When is your birthdate?",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Center(
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Secondary,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [

                          Expanded
                            (
                            child:

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    // Other form fields...
                                    BirthdateFormField(),
                                    // Other form fields...
                                  ],
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
                  child: Row(children:
                  [
                    Text('2',style: TextStyle(color: Primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                    Text("/5",style: TextStyle(color: Secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                  ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child:
                  ProgressLine(
                    value: 0.4, // Replace 0.8 with the actual progress value
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
                  child: Row(
                    children: [
                      ContinueButton(
                        buttonText: 'Continue',
                        nextPage: regGender(), // Replace NextPage with the actual next page widget
                      ),

                    ],
                  ),
                ),
              ],
            )
        ));
  }
}
