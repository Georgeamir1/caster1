import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/ui_components/componants.dart';

class Setting extends StatefulWidget{
@override
_SettingState createState() => _SettingState ();
}
class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Column(
        children: [
          Stack(
            children: [
              BackButtonWidget(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              Text(
                  "Discovery Settings",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black26,
                  )
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child:
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.location_on_outlined,color: Colors.black26),
                      ),

                      Text(
                          "Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      Spacer(),
                      Text(
                          "Egypt",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black26,
                          )
                      ),
                      Icon(Icons.navigate_next,color: Colors.black26,)
                    ],
                  ),
                ),),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Distance Preference",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          Text(
                              "${distance.round()} km",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Secondary,
                              )
                          )

                        ],
                      ),
                      Slider(
                        activeColor: Secondary,
                        inactiveColor: DefaultSelectionStyle.defaultColor,
                        value: distance,
                        onChanged: (value) {
                          setState(() {
                            distance= value;
                          });
                        },
                        min: 1,
                        max: 200,),
                      Divider(color: Colors.black12,),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                            "Only show people in this range",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26
                            )
                        ),
                        CupertinoSwitch(
                          activeColor: Secondary,
                          value: ShowPeobleinRange, onChanged: (value) {
                          setState(() {
                            ShowPeobleinRange = !ShowPeobleinRange;
                          });
                        },)
                      ],)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                    "Privacy ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26
                    )
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          color: Colors.black26,
                            NotificationSwitch? Icons.notifications_active_outlined : Icons.notifications_off_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                        activeColor: Secondary,
                        value: NotificationSwitch, onChanged: (value) {
                        setState(() {
                          NotificationSwitch =!NotificationSwitch;
                        });
                      },)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                onPressed: () {

              },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,),
                  child:
                  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.privacy_tip_outlined,color: Colors.black26),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                        ),
                        Text(
                            "Choose what data you share with us",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black26,
                            )
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.black26,)
                  ],
              ),
                ),),
              SizedBox(height: 16,),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                onPressed: () {

              },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,),
                  child:
                  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.text_snippet_outlined,color: Colors.black26),
                    ),
                    Text(
                        "Terms of Service",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    Spacer(),
                    Icon(Icons.navigate_next,color: Colors.black26,)
                  ],
              ),
                ),),
              SizedBox(height: 32,),
              Center(
                child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text("© 2023 Media way",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black26,
                        fontWeight: FontWeight.w500,)

                    )
                ),
              ),
            ],
        ),
          )
        ],
      )),
    );
  }
}