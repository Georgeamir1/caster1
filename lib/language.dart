import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/ui_components/componants.dart';

class Language extends StatefulWidget{
  @override
  _LanguageState createState() => _LanguageState ();
}
class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
           children: [
             Stack(
               children: [
                 BackButtonWidget(),
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.only(top: 28.0),
                     child: Text(
                         "Choose Language",
                         style: TextStyle(
                           fontSize: 24,
                           fontWeight: FontWeight.w700,
                         )
                     ),
                   ),
                 )
               ],
             ),

           ]),
     ),
   );
  }
 }