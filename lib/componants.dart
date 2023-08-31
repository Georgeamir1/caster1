import 'dart:ui';
import 'package:flutter/material.dart';
class BirthdateFormField extends StatefulWidget {
  @override
  _BirthdateFormFieldState createState() => _BirthdateFormFieldState();
}
class _BirthdateFormFieldState extends State<BirthdateFormField> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;
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
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        final formattedDate = "${picked.day}/${picked.month}/${picked.year}";
        _controller.text = formattedDate;
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
        labelText: 'Birthdate',
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
String name1 = 'John';
int age = 30;
double height = 1.75;
Color black = const Color(0xff17182a);
Color Primary = const Color(0xFF24377D);
Color Secondary = const Color(0xff91b6ee);
Color Secondary2 = const Color(0xffcce6ff);
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
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
  }}
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
          fixedSize: Size.fromHeight(56),
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
class ProgressLine extends StatelessWidget {
  final double value;

  const ProgressLine({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: Secondary,
        valueColor: AlwaysStoppedAnimation<Color>(Primary),
      ),
    );
  }
}

