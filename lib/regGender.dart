import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regBirthdate.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'Interests.dart';

class regGender extends StatefulWidget {
  @override
  _regGenderState createState() => _regGenderState();
}

final birthdatekey = GlobalKey<FormState>();

class _regGenderState extends State<regGender> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackButtonWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Text(
              "What is your gender?",
              style: TextStyle(
                color: Primary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 155,
              height: 144,
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ismale ? Primary : Colors.transparent),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ismale = !ismale;
                      isfemale = false;
                      print(ismale);
                      print(isfemale);

                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 28,
                          backgroundColor: Primary,
                          child: Icon(
                              size: 32,
                              color: Colors.white,
                              Icons.male_rounded)),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text("Male",
                            style: TextStyle(
                              color: Primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            SizedBox(
              width: 155,
              height: 144,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isfemale ? Colors.pinkAccent : Colors.transparent),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ismale = false;
                      isfemale = !isfemale;
                      print(ismale);
                      print(isfemale);

                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.pinkAccent,
                          child: Icon(
                              size: 32,
                              color: Colors.white,
                              Icons.male_rounded)),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text("Female",
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Row(
            children: [
              Text('3',
                  style: TextStyle(
                    color: Primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              Text("/5",
                  style: TextStyle(
                    color: Secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ProgressLine(
            value: 0.6, // Replace 0.8 with the actual progress value
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
          child: Row(
            children: [
              ContinueButton(
                buttonText: 'Continue',
                nextPage:
                    Interests(), // Replace NextPage with the actual next page widget
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
