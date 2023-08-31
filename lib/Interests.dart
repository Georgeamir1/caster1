import 'package:caster1/componants.dart';
import 'package:caster1/uploadimage.dart';
import 'package:flutter/material.dart';

class Interests extends StatefulWidget {
  @override
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  Map<String, bool> interests = {
    '💪 Gym & Fitness': false,
    '🐼 Animals': false,
    '🙂 People': false,
    '⚽️ Football': false,
    '🎨 Painting': false,
    '🍃 Nature': false,
    '✍🏻 Writing': false,
    '📚 Book': false,
    '👗 Fashion': false,
    '🏛 Architecture': false,
    '📸 Photography': false,
    '🎬 Movie': false,
    '🎵 Music': false,
    '🗣 Language': false,
    '💃🏻 Dancing': false,
    '🎮 Gaming': false,
  };

  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> currentRow = [];
    bool toggle = true; // To toggle between 3 and 2 chips per row
    for (String key in interests.keys) {
      currentRow.add(
        ChoiceChip(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(
              color: interests[key]! ? Color.fromRGBO(75, 22, 76, 0.1) : Colors.black12,
              width: 1.0,
            ),

          ),
          backgroundColor: Colors.white,
          selectedColor: Secondary,
          label: Text(key,style: TextStyle(color:interests[key]! ? Colors.white : Primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,)),
          selected: interests[key]!,
          onSelected: (bool selected) {
            setState(() {
              if (selected && selectedCount < 5) {
                interests[key] = true;
                selectedCount++;
              } else if (!selected && interests[key]!) {
                interests[key] = false;
                selectedCount--;
              }
                   });
          },
        ),
      );
      if ((toggle && currentRow.length == 2) || (!toggle && currentRow.length == 3)) {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.from(currentRow),
          ),
        );
        currentRow = [];
        toggle = !toggle;
      }
    }

    // Add any remaining chips
    if (currentRow.isNotEmpty) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.from(currentRow),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(),
            Center(
              child: Text(
                "Select up to 5 Skills",
                style: TextStyle(
                  color: Primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: rows,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                children: [
                   Text(
                    '4',
                    style: TextStyle(
                      color: Primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "/5",
                    style: TextStyle(
                      color: Secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child:
              ProgressLine(
                value: 0.8, // Replace 0.8 with the actual progress value
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24),
              child: Row(
                children: [
                  ContinueButton(
                    buttonText: 'Continue',
                    nextPage: ImagePickerPage(), // Replace NextPage with the actual next page widget
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}