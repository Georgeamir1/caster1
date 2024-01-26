import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'Password.dart';
import 'regDate.dart';

class regemail extends StatefulWidget {
  @override
  _regemailState createState() => _regemailState();
}


class _regemailState extends State<regemail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(),
            Center(
              child: Text(
                "Enter your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                children: [
                  Container(
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
                        Expanded(
                          child:
                          Form(
                            key: emailkey,
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
                                  emailkey.currentState!.validate();
                                  Email = value;
                                  print('$Email');
                                },
                                onSaved: (value) {
                                  Email = value!;
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
            End(value: 1, nextPage: regPassword())          ],
        ),
      ),
    );
  }
}