import 'package:cours/courspdf/pdf1.dart';
import 'package:flutter/material.dart';

class DescriptionSection1 extends StatelessWidget {
  final List<String> videoList = [
    'Introduction Langage C',
    'Structure programme C',
    'Instructions conditionnelles',
    'Instructions répétitives : Les boucles',
  ];
  final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => pdf1()),
    MaterialPageRoute(builder: (context) => pdf1()),
    MaterialPageRoute(builder: (context) => pdf1()),
    MaterialPageRoute(builder: (context) => pdf1()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
        
          onTap: () {
        //    Navigator.pushNamed(context, 'pdf${index + 1}');
        Navigator.pushNamed(context, 'pdf1');
          },
          child: ListTile(
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
          ),
        );
      },
    );
  }
}
