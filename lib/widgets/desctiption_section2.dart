import 'package:cours/courspdf/pdf2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionSection2 extends StatelessWidget {
 List videoList = [
    'Les instructions de contrôle des boucles ',
    'Les Tableaux en Langage C',
    'Définition et appel de fonction',
    'Les Pointeurs',
    'Chaînes de caractères en C',
  ];
final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => pdf2()),
    MaterialPageRoute(builder: (context) => pdf2()),
    MaterialPageRoute(builder: (context) => pdf2()),
    MaterialPageRoute(builder: (context) => pdf2()),
    MaterialPageRoute(builder: (context) => pdf2()),
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
        Navigator.pushNamed(context, 'pdf2');
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
