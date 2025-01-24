import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: duplicate_import
import 'package:google_fonts/google_fonts.dart';

class Choix extends StatelessWidget {
  const Choix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffF5F5F5),
        child: Column(children: <Widget>[
          ClipPath(
            clipper: Myclipper(),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 30, top: 50, right: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: null,
                          child: Text(
                            'Apprendre C',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: GoogleFonts.nunito().fontFamily,
                            ),
                          )),
                    ]),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF674AEF), Color(0xFF674AEF)])),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('login');
            },
            child: Column(children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ('images/usser.jpg'),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(10)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Color(0xFF674AEF),
                ),
                width: 300,
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Espace Utilisateur',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    )),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('loginAdmin');
            },
            child: Column(children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ('images/admin.jpg'),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(10)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Color(0xFF674AEF),
                ),
                width: 300,
                child: TextButton(
                    onPressed: null,
                    child: Text(
                      'Espace Admin',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    )),
              ),
            ]),
          )
        ]));
  }
}

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
