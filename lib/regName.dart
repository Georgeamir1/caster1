import 'package:caster1/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'regBirthdate.dart';

class name extends StatefulWidget {


  @override
  _nameState createState() => _nameState();
}
final namekey = GlobalKey<FormState>();
String? Name;


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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "What’s your name?",
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

                            Form(
                              key: namekey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your name',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  }, onChanged: (value) {
                                  namekey.currentState!.validate();
                                  Name = value;
                                  print('$Name');

                                },

                                  onSaved: (value) {
                                    Name = value!;
                                  },
                                ),
                              ),
                            ),
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
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // The radius of the rounded corners.
                    child: LinearProgressIndicator(
                      value: .2, // The current value of the progress indicator (between 0.0 and 1.0).
                      backgroundColor: Secondary, // The background color of the progress bar.
                      valueColor: AlwaysStoppedAnimation<Color>(Primary), // The color of the progress bar.
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 24),
                  child: Row(
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
                              MaterialPageRoute(builder: (context) => birthdateReg()),);
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
        ));

  }
}
