import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/location.dart';
import 'package:caster1/regGender.dart';
import 'package:caster1/regPhone.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

class regagencydate extends StatefulWidget {

  @override
  _regagencydateState createState() => _regagencydateState();
}
final birthdatekey = GlobalKey<FormState>();
DateTime? birthdate;

class _regagencydateState extends State<regagencydate> {
  @override

  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Agency Email",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Primary
                    )
                ),
                SizedBox(height: 8,),
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
                      Expanded(
                        child:
                        Form(
                          key: agencyemailkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // Regex pattern to validate email
                                String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'Enter a valid email address';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                agencyemailkey.currentState!.validate();
                                agencyEmail = value;
                                print('$agencyEmail');
                              },
                              onSaved: (value) {
                                agencyEmail = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Text(
                    "Agency phone number",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Primary
                    )
                ),
                SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  color: Colors.white
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
              ],
            ),
          ),
          Spacer(),
          End(value: 7, nextPage: location())
        ],
      ),
    ),
  );

  }
  }