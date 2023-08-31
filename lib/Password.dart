import 'package:caster1/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'Username.dart';
import 'regBirthdate.dart';

class regPassword extends StatefulWidget {


  @override
  _regPasswordState createState() => _regPasswordState();
}
final Passwordkey = GlobalKey<FormState>();
String? Password;


class _regPasswordState extends State<regPassword> {
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
                      "Enter your Password",
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
                                key: Passwordkey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }

                                      // Regex pattern to validate password
                                      String pattern =
                                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character.';
                                      }
                                      return null;
                                    },
                                    onChanged: (value)
                                    {
                                      Passwordkey.currentState!.validate();
                                      Password = value;
                                      print('$Password');
                                    },
                                    onSaved: (value) {
                                      Password = value!;
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
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
                  child: Row(
                    children: [
                      ContinueButton(
                        buttonText: 'Continue',
                        nextPage: regusername(), // Replace NextPage with the actual next page widget
                      ),

                    ],
                  ),
                ),

              ],
            )
        ));

  }
}
