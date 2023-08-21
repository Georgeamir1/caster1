import 'package:caster1/componants.dart';
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

                            Form(
                              key: birthdatekey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0, right: 8),
                                child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    labelText: 'Birthdate',
                                    hintText: 'Enter your birthdate',
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                  ),
                                  validator: (value) { if (value == null || value.isEmpty) {
                                    return 'Please enter your birthdate';
                                  }

                                  // Regular expression to check if the input matches the date format "YYYY-MM-DD"
                                  RegExp dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');

                                  if (!dateRegex.hasMatch(value)) {
                                    return 'Please enter a valid birthdate in the format YYYY-MM-DD';
                                  }

                                  // Convert the input string to a DateTime object
                                  DateTime birthdate;
                                  try {
                                    birthdate = DateTime.parse(value);
                                  } catch (error) {
                                    return 'Invalid date format';
                                  }

                                  // Get the current date
                                  DateTime currentDate = DateTime.now();

                                  // Check if the birthdate is in the future
                                  if (birthdate.isAfter(currentDate)) {
                                    return 'Birthdate cannot be in the future';
                                  }

                                  // Check if the person is at least 18 years old
                                  DateTime minimumAgeDate = currentDate.subtract(Duration(days: 365 * 18));
                                  if (birthdate.isAfter(minimumAgeDate)) {
                                    return 'You must be at least 18 years old';
                                  }

                                  // You can add more specific validation logic here if needed.

                                  // If all validations pass, return null to indicate no error
                                  return null;},
                                  onChanged: (value) {
                                    birthdatekey.currentState!.validate();
                                    try {
                                      birthdate = DateTime.parse(value);
                                      print('$birthdate');
                                    } catch (e) {
                                      print('Invalid date format');
                                    }
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // The radius of the rounded corners.
                      child: LinearProgressIndicator(
                        value: .4, // The current value of the progress indicator (between 0.0 and 1.0).
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
                              MaterialPageRoute(builder: (context) => regGender()),);
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
