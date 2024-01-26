import 'package:caster1/regDate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caster1/core/ui_components/componants.dart';


class regagencyname extends StatefulWidget
{
  @override
  _regagencynameState createState() => _regagencynameState();

}
class _regagencynameState extends State<regagencyname>
{

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(),
            Center(
              child: Text(
                  "Enter your Agency Name",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Primary,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
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
                      Form(
                        key: agencynamekey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Agency Name',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return 'Please enter your name';
                              }
                              return null;
                            }, onChanged: (value)
                          {
                            agencynamekey.currentState!.validate();
                            agencyname = value;
                            print('$agencyname');
                          },
                            onSaved: (value) {
                              agencyname = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0,top: 16),
              child: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Primary,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Secondary),

              ),
                child: Form(
                  key: agencyaboutKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: null, // Allows multiple lines
                      decoration: InputDecoration(

                        border:InputBorder.none,),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a description';
                          } else if (value!.length > 250) {
                            return 'Description must not exceed 250 characters';
                          }
                          return null; // Return null for no validation error
                        },

                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            End(value: 6, nextPage: birthdateReg())



          ],
        ),
      ),
    );
  }
}