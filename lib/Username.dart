import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regName.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'regDate.dart';

class regusername extends StatefulWidget {


  @override
  _regusernameState createState() => _regusernameState();
}
final usernamekey = GlobalKey<FormState>();
String? username;


class _regusernameState extends State<regusername> {
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
                      "Enter your username",
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
                                key: usernamekey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'username',
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your username';
                                      }
                                      // Regex pattern to validate username
                                      String pattern = r'^[a-zA-Z0-9]{3,30}$';
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'Username must be between 3 and 30 characters and contain only letters and numbers.';
                                      }
                                      return null;
                                    }
                                    ,
                                    onChanged: (value)
                                    {
                                      usernamekey.currentState!.validate();
                                      username = value;
                                      print('$username');
                                    },
                                    onSaved: (value) {
                                      username = value!;
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
                End(value: 3, nextPage: name())


              ],
            )
        ));

  }
}
