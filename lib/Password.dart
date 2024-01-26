import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regAgencyName.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'Username.dart';
import 'accType.dart';
import 'regDate.dart';
class regPassword extends StatefulWidget {


  @override
  _regPasswordState createState() => _regPasswordState();
}

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
                          color: Colors.white,
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
                                      // Check for minimum length
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters long';
                                      }

                                      // Check for at least one uppercase letter
                                      if (!value.contains(RegExp(r'[A-Z]'))) {
                                        return 'Password must contain at least one uppercase letter';
                                      }

                                      // Check for at least one lowercase letter
                                      if (!value.contains(RegExp(r'[a-z]'))) {
                                        return 'Password must contain at least one lowercase letter';
                                      }

                                      // Check for at least one digit
                                      if (!value.contains(RegExp(r'[0-9]'))) {
                                        return 'Password must contain at least one digit';
                                      }

                                      // Check for at least one special character
                                      if (!value.contains(RegExp(r'[!@#$%^&*()_+{}[\]:;<>,.?~\\-]'))) {
                                        return 'Password must contain at least one special character';
                                      }

                                      // Password meets all criteria
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
                End(value: 2, nextPage: model! ? regusername() : regagencyname())


              ],
            )
        ));

  }
}
