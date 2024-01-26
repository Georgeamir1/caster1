import 'dart:io';
import 'package:caster1/test.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'core/ui_components/componants.dart';
import 'editprofile.dart';
class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}
class _ImagePickerPageState extends State<ImagePickerPage> {
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
    print(context.screenHeight );
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(),
            Center(
              child: Text(
                  "Upload your photos",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Primary,
                  )
              ),
            ),
            SizedBox(height: 24),
            // First row with custom layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
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
            ),
            SizedBox(height: 8,), // GridView for the rest of the items
            Expanded(
              child: GridView.builder(padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                ),
                itemCount: images.length - 3,  // subtract the first three
                itemBuilder: (context, index) {
                  int imageIndex = index + 3;  // adjust index for the first three
                  return GestureDetector(
                    onTap: () => pickImage(imageIndex),
                    child: _buildImageContainer(imageIndex),
                  );
                },
              ),
            ),

          End(value: 9, nextPage: Editprofile())

          ],
        ),

      ),
    );
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
      images[index] == null
          ? Center(
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
          ))
          : ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.file(images[index]!, fit: BoxFit.cover),
      ),
    );
  }
  }

