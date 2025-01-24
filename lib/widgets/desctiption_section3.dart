import 'package:cours/courspdf/pdf3.dart';
import 'package:cours/courspdf/pdf4.dart';
import 'package:cours/courspdf/pdf5.dart';
import 'package:cours/courspdf/pdf6.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionSection3 extends StatelessWidget {
  List videoList = [
    'Allocation dynamique de la mémoire',
    'Les Enregistrement & Fichiers',
    'Les Listes Chainee',
    'Les Piles et File',
    'Les Arbes'
  ];
  final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => pdf3()),
    MaterialPageRoute(builder: (context) => pdf3()),
    MaterialPageRoute(builder: (context) => pdf4()),
    MaterialPageRoute(builder: (context) => pdf5()),
    MaterialPageRoute(builder: (context) => pdf6()),
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
            Navigator.pushNamed(context, 'pdf${index + 2}');
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
