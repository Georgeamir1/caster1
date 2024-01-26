import 'package:caster1/core/ui_components/componants.dart';
import 'package:caster1/regLanguages.dart';
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
  void printSelectedItems() {
    List<String> selectedItems = [];
    interests.forEach((key, value) {
      if (value) {
        selectedItems.add(key);
      }
    });
    print("Selected Items: ${selectedItems.join(', ')}");
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> currentRow = [];
    bool toggle = true; // To toggle between 3 and 2 chips per row
    for (String key in interests.keys) {
      currentRow.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ChoiceChip(
            padding: EdgeInsets.symmetric(vertical: 8,),
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
                  printSelectedItems();
                } else if (!selected && interests[key]!) {
                  interests[key] = false;
                  selectedCount--;
                  printSelectedItems();
                }
                     });
            },
          ),
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
           End(value: 7, nextPage: regLanguage())
          ],
        ),
      ),
    );
  }
}
