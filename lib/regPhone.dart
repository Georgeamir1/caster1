import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'onboarding3.dart';

class regPhone extends StatefulWidget {


  @override
  _regPhoneState createState() => _regPhoneState();
}
final PhoneKey = GlobalKey<FormState>();
String phoneNumber='';
class _regPhoneState extends State<regPhone> {

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
                    "Enter your number",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,),
                          child: Image.asset('assets/images/flag.png',width: 32,height: 24,),
                        ),
                        Text(
                          "+20",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 20,
                            width: 1,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        Expanded
                          (
                          child:
                          Form(
                            key: PhoneKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0, right: 8),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  hintText: 'Enter your phone number',
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a phone number';
                                  }
                                  if (!RegExp(r'^(01)[0125]\d{8}$').hasMatch(value)) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  PhoneKey.currentState!.validate();
                                  phoneNumber = value;
                                  print('$phoneNumber');

                                },
                                onSaved: (value) {
                                  phoneNumber = value!;

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
                            MaterialPageRoute(builder: (context) => verPhone()),);

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
