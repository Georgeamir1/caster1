import 'package:caster1/componants.dart';
import 'package:caster1/regPhone.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'regName.dart';
import 'onboarding3.dart';

class verPhone extends StatefulWidget {


  @override
  _verPhoneState createState() => _verPhoneState();
}


class _verPhoneState extends State<verPhone> {
  final _formKey = GlobalKey<FormState>();
  String _verificationCode = '';
  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body:
        SafeArea(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:Colors.black12,
                        width: 0.5,
                      ),
                    ),
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onboarding3()),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Enter 4-digits code",
                      style: TextStyle(
                        color: Primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 56,),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Secondary,
                                    width: .5,
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                                child: TextFormField(style:TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ) ,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      setState(() {
                                        _verificationCode += value;
                                      });
                                      // Move focus to the next text field if available
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty && _verificationCode.length > 0) {
                                      // Move focus to the previous text field if available
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        _verificationCode = _verificationCode.substring(0, _verificationCode.length - 1);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Secondary,
                                    width: .5,
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                                child: TextFormField(style:TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ) ,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      setState(() {
                                        _verificationCode += value;
                                      });
                                      // Move focus to the next text field if available
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty && _verificationCode.length > 0) {
                                      // Move focus to the previous text field if available
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        _verificationCode = _verificationCode.substring(0, _verificationCode.length - 1);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '',
                                  ),
                                ),
                              ),
                            ),
                            Container(

                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Secondary,
                                    width: .5,
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                                child: TextFormField(style:TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ) ,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      setState(() {
                                        _verificationCode += value;
                                      });
                                      // Move focus to the next text field if available
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty && _verificationCode.length > 0) {
                                      // Move focus to the previous text field if available
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        _verificationCode = _verificationCode.substring(0, _verificationCode.length - 1);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '',
                                  ),
                                ),
                              ),
                            ),
                            Container(

                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Secondary,
                                    width: .5,
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                                child: TextFormField(style:TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ) ,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      setState(() {
                                        _verificationCode += value;
                                      });
                                      // Move focus to the next text field if available
                                    } else if (value.isEmpty && _verificationCode.length > 0) {
                                      // Move focus to the previous text field if available
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        _verificationCode = _verificationCode.substring(0, _verificationCode.length - 1);
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '',
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
                const SizedBox(height: 24,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Didn’t received the code?",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        )
                    ), TextButton(onPressed: () {
                    }, child: Text('Resend Code',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ))),],),
                Text('$_verificationCode'),
                Spacer(),
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
                            // Future<void> sendData() async {
                            //   final response = await http.post(
                            //     Uri.parse('https://casty.pythonanywhere.com/api/auth/users'),
                            //     body: data,
                            //   );
                            //   if (response.statusCode == 200) {
                            //     // Handle the response from the backend
                            //     print(response.body);
                            //   } else {
                            //     // Handle the error
                            //     print('Request failed with status: ${response.statusCode}.');
                            //   }
                            // }
                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            )
        ));
  }
}
