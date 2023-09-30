import 'package:caster1/editprofile.dart';
import 'package:caster1/setting.dart';
import 'package:caster1/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/ui_components/componants.dart';
import 'language.dart';
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile>{
  @override
  Widget build(BuildContext context) {
return Scaffold
  (
  body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: FileImage(images[0]!)
                         ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text("$FullName , $age",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),

                    ],),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Location"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(color: Secondary,
                      borderRadius: BorderRadius.circular(16)),
                      child: Row(children:
                      [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CircleAvatar(radius: 20,
                            backgroundColor: Colors.white,
                          child: Text(
                            "70%",
                            textAlign: TextAlign.center,
                            style: TextStyle
                              (
                                fontWeight: FontWeight.w700,
                                color: Primary),
                          ),),
                        ),
                        Text(
                            "Complete your \n profile to stand out",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                               color: Colors.white
                            )
                        ),
                        SizedBox(width: 8,),
                        ContinueButton(buttonText: "complete profile", nextPage: Editprofile()),
                        SizedBox(width: 8,),

                      ]),
                    ),
                  ),
                  SizedBox(height: 40,),
                  ProfileButtons(
                    icon: Icon(Icons.person_2_outlined,color: Secondary),
                      buttonText: "My Account",
                    nextPage: profile(),
                  ),
                  SizedBox(height: 16,),
                  ProfileButtons(
                    icon: Icon(Icons.star,color: Secondary),
                      buttonText: "Previous work",
                    nextPage: profile(),
                  ),
                  SizedBox(height: 16,),
                  ProfileButtons(
                    icon: Icon(Icons.translate,color: Secondary),
                      buttonText: "Language",
                    nextPage: Language(),
                  ),
                  SizedBox(height: 16,),
                  ProfileButtons(
                    icon: Icon(Icons.settings,color: Secondary),
                      buttonText: "Setting",
                    nextPage: Setting(),
                  ),
                ],
              ),
              ),
         ],
      )),
      );

  }


}