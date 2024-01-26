import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../accType.dart';
import '../../regName.dart';
import '../enums/device_type.dart';
import '../functions/get_device_type.dart';
// ........................................................
List<File?> images = [null, null, null, null, null, null];
class BirthdateFormField extends StatefulWidget {
  @override
  _BirthdateFormFieldState createState() => _BirthdateFormFieldState();
}
class _BirthdateFormFieldState extends State<BirthdateFormField> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
        _controller.text = formattedDate;

        // Calculate the age and store it in the age variable.
        final currentDate = DateTime.now();
        age = currentDate.year - picked.year;
        if (currentDate.month < picked.month ||
            (currentDate.month == picked.month && currentDate.day < picked.day)) {
          age = age! - 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        hintText: selectedDate == null
            ? model! ? 'Select your birth date' : "Select date of establishment"
            : "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}",
        border: InputBorder.none,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select your birthdate';
        }
        return null;
      },
    );
  }
}
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 2.0),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
            radius: 20.0,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
class ProfileButtons extends StatelessWidget {
  final String buttonText;
  final Widget icon;
  final Widget nextPage;
  const ProfileButtons({
    Key? key,
    required this.buttonText,
    required this.icon,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 60.0, // Set a specific height constraint
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            fixedSize: Size.fromHeight(60.0), // Also set a fixedSize here
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          },
          child: Row(
            children: [
              icon,
              SizedBox(width: 10.0), // Add some spacing between icon and text
              Text(
                buttonText,
                style:
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
              Spacer(),
              Icon(Icons.navigate_next,color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
class ContinueButton extends StatelessWidget {
  final String buttonText;
  final Widget nextPage;
  const ContinueButton({
    Key? key,
    required this.buttonText,
    required this.nextPage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          fixedSize: Size.fromHeight(context.screenHeight * 0.06),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
class ContinueButton2 extends StatelessWidget {
  final Widget nextPage;
  const ContinueButton2({
    Key? key,
    required this.nextPage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 48),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,

        children: [

          FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded),
            backgroundColor: Primary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            },

          ),
        ],
      ),
    );
  }
}
class End extends StatelessWidget {
  final Widget nextPage;
  final int value;
  const End({
    Key? key,
    required this.value,
    required this.nextPage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Stack(alignment: Alignment.bottomRight,
        children: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 48),
    child: Row(mainAxisAlignment: MainAxisAlignment.end,

    children: [

    FloatingActionButton(
    child: Icon(Icons.arrow_forward_rounded),
    backgroundColor: Primary,
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
    );
    },

    ),
    ],
    ),
    ),
          Column(
    children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0,),
    child: Row(children:
    [
    Text('$value',style: TextStyle(color: Primary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    )),
    Text(model!? "/9": "/7",style: TextStyle(color: Secondary,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    )),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(24),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: LinearProgressIndicator(
    value: model!? value/9 : value/7,
    backgroundColor: Secondary,
    valueColor: AlwaysStoppedAnimation<Color>(Primary),
    ),
    ),
    ),
    ],
    )
        ],
      );

  }
}
class SignInButton extends StatelessWidget {
  final String? buttonText;
  final Widget? nextPage;

  const SignInButton({
    Key? key,
    this.buttonText = "Sign In", // Default text
    this.nextPage, // Default is null, will not navigate anywhere
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          fixedSize: Size.fromHeight(context.screenHeight * 0.06),
        ),
        onPressed: () {
          if (nextPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage!),
            );
          }
        },
        child: Text(
          buttonText!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
class ProgressLine extends StatelessWidget {
  final int value;
  const ProgressLine({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,),
          child: Row(children:
          [
            Text('$value',style: TextStyle(color: Primary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
            Text("/7",style: TextStyle(color: Secondary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
          ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: LinearProgressIndicator(
              value: value/7,
              backgroundColor: Secondary,
              valueColor: AlwaysStoppedAnimation<Color>(Primary),
            ),
          ),
        ),
      ],
    );
  }
}
extension ContextExtension on BuildContext {
  DeviceType get deviceType => getDeviceType(MediaQuery.of(this));
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}
class LanguageContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  LanguageContainer({
    required this.imagePath,
    required this.text,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: Row(
          children: [
            Image.asset(
              imagePath,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )
              ),
            ),
            Checkbox(
              activeColor: Secondary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              value: isChecked,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

// ........................................................


bool ismale = false;
bool isfemale = false;

bool ShowPeobleinRange = false;

bool NotificationSwitch = false;

bool visable = false;

bool Travelin = false;
bool Travelout = false;
// ........................................................
double height = 120;
double weight = 70;
double distance = 50;

DateTime? selectedDate;
int? age;

// ........................................................
Color black = const Color(0xff17182a);
Color Primary = const Color(0xFF24377D);
Color Secondary = const Color(0xff91b6ee);
Color Secondary2 = const Color(0xffcce6ff);
// ........................................................
GlobalKey<FormState> aboutKey = GlobalKey<FormState>();
GlobalKey<FormState> agencyaboutKey = GlobalKey<FormState>();
final daysoutkey = GlobalKey<FormState>();
int daysout = 0;
final Racekey = GlobalKey<FormState>();
String? Race;
final Eyecolorkey = GlobalKey<FormState>();
String? Eyecolor;
final Haircolorkey = GlobalKey<FormState>();
String? Haircolor;
final Fullnamekey = GlobalKey<FormState>();
String FullName = stName! + secName!;
final emailkey = GlobalKey<FormState>();
String? Email;
final agencyemailkey = GlobalKey<FormState>();
String? agencyEmail;
final Passwordkey = GlobalKey<FormState>();
String? Password;
final agencynamekey = GlobalKey<FormState>();
String? agencyname;
final PhoneKey = GlobalKey<FormState>();
String phoneNumber='';