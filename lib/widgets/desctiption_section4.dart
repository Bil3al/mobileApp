import 'package:cours/courspdf/pdf7.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionSection4 extends StatelessWidget {
   List videoList = [
    ' Creation des Processus  ',
    'Synchronisation des processus',
    'Creations des  Threads',
    'gestion des threads',
  ];

  final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => pdf7()),
    MaterialPageRoute(builder: (context) => pdf7()),
    MaterialPageRoute(builder: (context) => pdf7()),
    MaterialPageRoute(builder: (context) => pdf7()),
    MaterialPageRoute(builder: (context) => pdf7()),
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
        Navigator.pushNamed(context, 'pdf7');
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
