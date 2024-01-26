import 'package:flutter/material.dart';
import 'core/ui_components/componants.dart';
import 'package:caster1/uploadimage.dart';

class regLanguage extends StatefulWidget {
  @override
  _regLanguageState createState() => _regLanguageState();
}

class _regLanguageState extends State<regLanguage> {
  List<int> selectedIndices = []; // List of selected indices
  List<String> selectedLanguages = []; // List of selected languages

  // List of languages and their corresponding image paths
  final List<Map<String, String>> languages = [
    {'text': 'English', 'imagePath': 'assets/images/English.png'},
    {'text': 'German', 'imagePath': 'assets/images/German.png'},
    {'text': 'French', 'imagePath': 'assets/images/French.png'},
    {'text': 'Spanish', 'imagePath': 'assets/images/Spanish.png'},
    {'text': 'Portuguese', 'imagePath': 'assets/images/Portugal.png'},
    {'text': 'Russian', 'imagePath': 'assets/images/Russian.png'},
    {'text': 'Italian', 'imagePath': 'assets/images/Italy.png'},
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
                      "Choose your Languages",
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
                    isChecked: selectedIndices.contains(index),
                    onChanged: (bool? newValue) {
                      setState(() {
                        if (newValue == true) {
                          // Add the selected index and language to the lists
                          selectedIndices.add(index);
                          selectedLanguages.add(langMap['text']!);
                        } else {
                          // Remove the unselected index and language from the lists
                          selectedIndices.remove(index);
                          selectedLanguages.remove(langMap['text']!);
                        }
                        print(selectedLanguages);
                      });
                    },
                  );
                },
              ),
            ),
            End(value: 8, nextPage: ImagePickerPage())
          ],
        ),
      ),
    );
  }
}