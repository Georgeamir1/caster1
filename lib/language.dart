import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/ui_components/componants.dart';
class Language extends StatefulWidget{
  @override
  _LanguageState createState() => _LanguageState ();
}
class _LanguageState extends State<Language> {
  int selectedIndex = -1; // -1 means no selection
  String language = "";
  // List of languages and their corresponding image paths
  final List<Map<String, String>> languages = [
    {'text': 'English', 'imagePath': 'assets/images/English.png'},
    {'text': 'German', 'imagePath': 'assets/images/German.png'},
    {'text': 'French', 'imagePath': 'assets/images/French.png'},
    {'text': 'Spanish', 'imagePath': 'assets/images/Spanish.png'},
    {'text': 'Portugase', 'imagePath': 'assets/images/Portugal.png'},
    {'text': 'Russian', 'imagePath': 'assets/images/Russian.png'},
    {'text': 'Italy', 'imagePath': 'assets/images/Italy.png'},
  ];
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final langMap = languages[index];
                  return LanguageContainer(
                    imagePath: langMap['imagePath']!,
                    text: langMap['text']!,
                    isChecked: selectedIndex == index,
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue == true) {
                          selectedIndex = index;
                          language = langMap['text']!; // Store the selected language
                        }
                        else {
                          // Unselect if the user tries to uncheck a checkbox
                          selectedIndex = -1;
                          language = ""; // Reset to empty string if no selection
                        }
                        print(language);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
