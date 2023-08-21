import 'package:caster1/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';
class regGender extends StatefulWidget {
  @override
  _regGenderState createState() => _regGenderState();
}
final birthdatekey = GlobalKey<FormState>();
class _regGenderState extends State<regGender> {
  bool ismale=false;
  bool isfemale=false;

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
                      "What is your gender?",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    SizedBox(
                      width: 155,
                      height: 144,
                      child:
                      Container(decoration: BoxDecoration(
                        border: Border.all(color:  ismale ? Primary: Colors.transparent) ,
                        borderRadius: BorderRadius.circular(24),),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ismale=!ismale;
                              isfemale= false;

                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),

                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(radius: 28,backgroundColor: Primary,child: Icon(size: 32,color: Colors.white,Icons.male_rounded)),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                    "Male",
                                    style: TextStyle(color: Primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                              )                          ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    SizedBox(
                      width: 155,
                      height: 144,
                      child:
                      Container(decoration: BoxDecoration(
                        border: Border.all(color:  isfemale ? Colors.pinkAccent:Colors.transparent ) ,
                        borderRadius: BorderRadius.circular(24),),
                        child: ElevatedButton(
                          onPressed: () { setState(() {
                            ismale=false;
                            isfemale=!isfemale;

                          });},
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(radius: 28,backgroundColor: Colors.pinkAccent,child: Icon(size: 32,color: Colors.white,Icons.male_rounded)),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                    "Female",
                                    style: TextStyle(color: Colors.pinkAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                              )                          ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
                  child: Row(children:
                  [
                    Text('3',style: TextStyle(color: Primary,
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
                        value: .6, // The current value of the progress indicator (between 0.0 and 1.0).
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
