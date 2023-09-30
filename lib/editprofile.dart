import 'dart:io';
import 'package:caster1/profile.dart';
import 'package:caster1/regName.dart';
import 'package:caster1/regVerPhone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'regPhone.dart';
import 'core/ui_components/componants.dart';
import 'core/ui_components/info_widget.dart';
class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}
class _EditprofileState extends State<Editprofile> {

  Future<void> pickImage(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        images[index] = File(pickedFile.path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    String Gender = ismale ? "male" : "female";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    BackButtonWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Edit Profile",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Primary))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    // First big item
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => pickImage(0),
                        child: _buildImageContainer(0, height: 200),
                      ),
                    ),
                    SizedBox(width: 16),
                    // Next two vertically stacked items
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => pickImage(1),
                            child: _buildImageContainer(1, height: 95),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => pickImage(2),
                            child: _buildImageContainer(2, height: 95),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,), // GridView for the rest of the items
                Container(height: 120,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 16,

                    ),
                    itemCount: images.length - 3,  // subtract the first three
                    itemBuilder: (context, index) {
                      int imageIndex = index + 3;
                      // adjust index for the first three
                      return GestureDetector(
                        onTap: () => pickImage(imageIndex),
                        child: _buildImageContainer(imageIndex),

                      );
                    },
                  ),
                ),
                SizedBox(height: 8,),// First row with custom layout
                Text("Personal Details",
                    style:
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    )
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Full Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: Fullnamekey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: '$FullName', border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Fullnamekey.currentState!.validate();
                          FullName = value;
                          print('$FullName');
                        },
                        onSaved: (value) {
                          FullName = value!;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,), // GridView for the rest of the items
                Text("Birthdate",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: [
                              // Other form fields...
                              BirthdateFormField(),
                              // Other form fields...
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 16,), // GridView for the rest of the items
                Text("About",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: aboutKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: null, // Allows multiple lines
                        maxLength: 250, // Maximum character limit
                        decoration: InputDecoration(
                          hintText: 'Enter your description ',
                          border: InputBorder.none,
                          // You can add more decoration properties like prefixIcon, suffixIcon, etc.
                        ),
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
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("MY interests",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    TextButton(onPressed: () {
                    }, child: Text("Edit"))
                  ],
                ),
                Container( width: double.infinity,
                  height: 56,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("data",style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ) ,),
                  )
                ),
                SizedBox(height: 16,), // GridView for the rest of the items
                Text("Gender",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Container(alignment: AlignmentDirectional.centerStart,
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$Gender',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: 16,), // GridView for the rest of the items
                Text("Location",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Container(alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('location',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: 16,), // GridView for the rest of the items
                Text("More info",
                    style:
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                    )
                ),
                SizedBox(height: 24,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                [
                  Text(
                      "Your profile visible to the public ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  CupertinoSwitch(

                 activeColor: Primary,
                    value: visable,
                    onChanged: (value) {
                    setState(() {
                      visable=!visable;
                    }
                    );
                  },
                  ),
                ],),
                SizedBox(height: 24,),
                Text(
                    "Height ( ${height.round()} CM )",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )
                ),
                SizedBox(height: 24,),
                Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:
                 [
                   Image.asset("assets/images/man.png",height: 30),
                   Expanded(
                     child: CupertinoSlider(
                       activeColor: Primary,
                       value: height,
                       onChanged: (value) {
                         setState(() {
                           height= value;
                         });
                       },
                       min: 50,
                       max: 300,
                     ),
                   ),

                   Image.asset("assets/images/man.png",height: 40,),
                 ]
                   ,),
               ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Text("50 CM"),
                    Text("300 CM"),
                  ]
                  ,),
                SizedBox(height: 40,),
                Text(
                    "Weight ( ${weight.round()} KG )",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )
                ),
                SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 12),
                  child: Row(
                   children:
               [
Image.asset("assets/images/man.png",height: 30),
                   Expanded(
                     child: CupertinoSlider(
                       activeColor: Primary,
                       value: weight,
                       onChanged: (value) {
                         setState(() {
                           weight= value;
                         });
                       },
                       min: 20,
                       max: 200,
                     ),
                   ),
                   Image.asset("assets/images/fat.png",height: 30,),
               ]
                   ,),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Text("20 KG"),
                    Text("200 KG"),
                  ]
                  ,),
                SizedBox(height: 24,),
                Text(
                    "Race",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Container(alignment: AlignmentDirectional.centerStart,
                    child:
                    ReusableTextFormField(
                        formKey: Racekey,
                        hintText: 'Enter your race',
                        value: "$Race",
                        onChanged: (value) {
                          Racekey.currentState!.validate();
                          Race = value;
                          print('$Race');
                        },
                        onSaved: (value) {
                          Race = value!;
                        },
                      ),
                    width: double.infinity,
                    height: 56,
                    decoration:     BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white)
                ),
                SizedBox(height: 24,),
                Text(
                    "Eye color",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Container(alignment: AlignmentDirectional.centerStart,
                    child:
                    ReusableTextFormField(
                      formKey: Eyecolorkey,
                      hintText: 'Enter your Eye color',
                      value: "$Eyecolor",
                      onChanged: (value) {
                        Eyecolorkey.currentState!.validate();
                        Eyecolor = value;
                        print('$Eyecolor');
                      },
                      onSaved: (value) {
                        Eyecolor = value!;
                      },
                    ),
                    width: double.infinity,
                    height: 56,
                    decoration:     BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white)
                ),
                SizedBox(height: 24,),
                Text(
                    "Hair color",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Container(alignment: AlignmentDirectional.centerStart,
                    child:
                    ReusableTextFormField(
                      formKey: Haircolorkey,
                      hintText: 'Enter your Hair color',
                      value: "$Haircolor",
                      onChanged: (value) {
                        Haircolorkey.currentState!.validate();
                        Haircolor = value;
                        print('$Haircolor');
                      },
                      onSaved: (value) {
                        Haircolor = value!;
                      },
                    ),
                    width: double.infinity,
                    height: 56,
                    decoration:     BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white)
                ),
                SizedBox(height: 24,),
                Text(
                    "Phone number",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Container(alignment: AlignmentDirectional.centerStart,
                    child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "+20",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 20,
                            width: 1,
                            decoration:
                            BoxDecoration(
                              color: Colors.black26,
                              border: Border.all(
                                color: Colors.black26,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                          Form(
                            key: PhoneKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                hintText: 'Enter your phone number',
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a phone number';
                                }
                                if (!RegExp(r'^(01)[0125]\d{8}$').hasMatch(value)) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                PhoneKey.currentState!.validate();
                                phoneNumber = value;
                                print('$phoneNumber');

                              },
                              onSaved: (value) {
                                phoneNumber = value!;

                              },

                            ),
                          ),

                        ),
                      ],
                    )
                ),
                    width: double.infinity,
                    height: 56,
                    decoration:
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white)
                ),
                TextButton(
                    onPressed: () {

                },
                    child: Text(
                    "+Add anther phone number",
                    style: TextStyle(
                      color: Primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )
                )),
                Text(
                    "Capable to travel  ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      activeColor: Primary,
                      value: Travelin,
                      onChanged: (value) {
                        setState(() {
                          Travelin=!Travelin;
                        });
                    },),
                    Text(
                        "In board",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      activeColor: Primary,
                      value: Travelout,
                      onChanged: (value) {
                        setState(() {
                          Travelout=!Travelout;
                        });
                    },),
                    Text(
                        "Out board",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),


                  ],
                ),
                Row(
                  children: [
                    Text(
                        "How many days you can stay away from home",
                        style: TextStyle(
                          color: Primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),
                          alignment: AlignmentDirectional.center,
                        height: 30,
                        width: 40,
                        child: Form( child:
                        TextFormField(textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          key: daysoutkey,
                        keyboardType: TextInputType.number,
                        decoration:
                        InputDecoration(
                          border: InputBorder.none,
                          hintText: "...",
                        ),
                          style:
                            TextStyle(color: Primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        ))
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80,),
                Row(
                  children:
                  [
                    ContinueButton(
                      buttonText: "Saved Changes",
                      nextPage: profile())
                  ],),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget _buildImageContainer(int index, {double height = double.infinity}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(16),
    ),
    child:
    images[index] == null ? Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.tag_faces_rounded,size: 35, color: Colors.black26),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(decoration:BoxDecoration(color: Secondary,borderRadius: BorderRadius.circular(32)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row
                        (mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Icon(Icons.add,color: Colors.white),
                          Text('Add',style: TextStyle(color: Colors.white),)
                        ],),
                    )),
              )
            ],
          ),
        )) : ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.file(images[index]!, fit: BoxFit.cover),
    ),
  );
}

