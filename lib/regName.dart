import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'regBirthdate.dart';

class name extends StatefulWidget {


  @override
  _nameState createState() => _nameState();
}
final stnamekey = GlobalKey<FormState>();
final secnamekey = GlobalKey<FormState>();
String? stName;
String? secName;
class _nameState extends State<name> {
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
                Center(
                  child: Text(textAlign: TextAlign.center,
                      "What’s your name?",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
                SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
                  child:
                  Column(
                    children: [
                      Container(
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
                              Form(
                                key: stnamekey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'First name',
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),
                                    validator: (value)
                                    {
                                      if (value == null || value.isEmpty)
                                      {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    }, onChanged: (value)
                                  {
                                    stnamekey.currentState!.validate();
                                    stName = value;
                                    print('$stName');
                                  },
                                    onSaved: (value) {
                                      stName = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32,),
                      Container(
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
                              Form(
                                key: secnamekey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Last name',
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),
                                    validator: (value)
                                    {
                                      if (value == null || value.isEmpty)
                                      {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    }, onChanged: (value)
                                  {
                                    secnamekey.currentState!.validate();
                                    secName = value;
                                    print('$secName');
                                  },
                                    onSaved: (value) {
                                      secName = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
                   child: Row(children:
                [
                    Text('1',style: TextStyle(color: Primary,
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
                  child: ProgressLine(value: 0.2, // Replace 0.8 with the actual progress value
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
                  child: Row(
                    children: [
                      ContinueButton(
                        buttonText: 'Continue',
                        nextPage: birthdateReg(), // Replace NextPage with the actual next page widget
                      ),

                    ],
                  ),
                ),

              ],
            )
        ));

  }
}
