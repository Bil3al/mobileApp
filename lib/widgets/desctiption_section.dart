import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionSection extends StatelessWidget {
  List videoList = [
    'Introduction to Flutter',
    'Installing Flutter on Windows',
    'Setup Emulator on Windows',
    'Creating our First App',
  ];

  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.picture_as_pdf_sharp,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(videoList[index]),
          //  subtitle: Text(""),
        );
      },
    );
  }
}
