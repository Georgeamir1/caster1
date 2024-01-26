import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regAgencyData.dart';
import 'package:caster1/regGender.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'accType.dart';

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
                      model!?
                      "When is your birthdate?" :" Your agency since date?" ,
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
                End(value: 5, nextPage:model!? regGender() : regagencydate() )
              ],
            )
        ));
  }
}
