import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/editprofile.dart';
import 'package:caster1/regGender.dart';
import 'package:caster1/regPhone.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

class location extends StatefulWidget {

  @override
  _locationState createState() => _locationState();
}
final birthdatekey = GlobalKey<FormState>();
DateTime? birthdate;

class _locationState extends State<location> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: context.screenHeight * 0.07,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.search,color: Colors.black26),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {

                            },
                                icon:Icon(Icons.close,color: Colors.black26) ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.03,),
                    Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    SizedBox(height: context.screenHeight * 0.02,),
                    Container(
                      decoration:
                      BoxDecoration(
                        color: Secondary,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      height:context.screenHeight * 0.44 ,),
                    SizedBox(height: context.screenHeight * 0.04,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on,color: Primary),
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "110 The Embarcadero, San Fransisco",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )
                            ),

                            Text(
                                "Commonwealth Club",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black26
                                )
                            ),

                          ],
                        )
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.08,),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(

                                style: ElevatedButton.styleFrom(
                                  primary: Primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  fixedSize: Size.fromHeight(context.screenHeight * 0.07),
                                ),

                                onPressed: ()
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Editprofile()),
                                  );

                                },
                                child: Text("Confirm location",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                )
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );}}