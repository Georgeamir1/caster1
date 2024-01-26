import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/loginVerPhone.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/material.dart';

import 'accType.dart';
import 'onboarding3.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
bool shown =false;
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: SafeArea(
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButtonWidget(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                      "Enter your Email and Password to login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Primary
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child:
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Primary

                              )
                          ),
                        ),
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



                              Expanded
                                (
                                child:
                                Form(
                                  key: emailkey,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                    child: TextFormField(

                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0,bottom: 8),
                          child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Primary

                              )
                          ),
                        ),
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
                                  key: Passwordkey,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: shown? false : true,
                                      decoration: InputDecoration(

                                        hintText: 'Password',
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        // Check for minimum length
                                        if (value.length < 8) {
                                          return 'Password must be at least 8 characters long';
                                        }

                                        // Check for at least one uppercase letter
                                        if (!value.contains(RegExp(r'[A-Z]'))) {
                                          return 'Password must contain at least one uppercase letter';
                                        }

                                        // Check for at least one lowercase letter
                                        if (!value.contains(RegExp(r'[a-z]'))) {
                                          return 'Password must contain at least one lowercase letter';
                                        }

                                        // Check for at least one digit
                                        if (!value.contains(RegExp(r'[0-9]'))) {
                                          return 'Password must contain at least one digit';
                                        }
                                        // Check for at least one special character
                                        if (!value.contains(RegExp(r'[!@#$%^&*()_+{}[\]:;<>,.?~\\-]'))) {
                                          return 'Special character required';
                                        }
                                        // Password meets all criteria
                                        return null;
                                      },
                                      onChanged: (value)
                                      {
                                        Passwordkey.currentState!.validate();
                                        Password = value;
                                        print('$Password');
                                      },
                                      onSaved: (value) {
                                        Password = value!;
                                      },
                                    ),
                                  ),
                                ),

                              ),
                              IconButton(
                                  onPressed: () {
                                setState(() {
                                  shown = !shown;
                                });

                              },
                                  icon: Icon(shown ? Icons.visibility_outlined : Icons.visibility_off_outlined ,
                                color: Primary,)
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.1,),
                        Row(
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
                                onPressed: () {},
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(
                                "OR",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black26,
                                )
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child:
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32), // Set the border radius
                                      ),

                                    ),
                                    fixedSize: MaterialStatePropertyAll(
                                      Size(double.infinity, context.screenHeight * 0.067),
                                    )
                                  // Set the height of the button
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/google.png',height: 30,),
                                    Spacer(),
                                    Text(
                                      "Login with Google",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Primary
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child:
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32), // Set the border radius
                                      ),

                                    ),
                                    fixedSize: MaterialStatePropertyAll(
                                      Size(double.infinity, context.screenHeight * 0.067),
                                    )
                                  // Set the height of the button
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/apple.png',height: 30,),
                                    Spacer(),
                                    Text(
                                      "Login with Apple",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Primary
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 32),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(textAlign: TextAlign.center,
                                "Don’t have an account? ",
                                style: TextStyle(color: black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => acctype()),);

                                },
                                child: Text('Sign up',style: TextStyle(color: Secondary,
                                  fontSize:14,
                                  fontWeight: FontWeight.w400,))
                            )],
                        ),

                      ],
                    ),
                  ),

                ],
              )
          ),
        ));
  }
}
