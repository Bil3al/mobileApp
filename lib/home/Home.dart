// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cours/LangageFolder/cours1.dart';
import 'package:cours/LangageFolder/cours2.dart';
import 'package:cours/LangageFolder/cours3.dart';
import 'package:cours/LangageFolder/cours4.dart';
import 'package:cours/home/account.dart';
// ignore: unused_import
import 'package:cours/home/course_screen.dart';
import 'package:cours/home/login.dart';
// ignore: unused_import
import 'package:cours/quiz/admin/adminlogin.dart';
// ignore: unused_import
import 'package:cours/quiz/question.dart';
// ignore: unused_import
import 'package:cours/quiz/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:cours/chatbot/chatbot.dart';
// import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  @override
  // ignore: override_on_non_overriding_member
  final List<MaterialPageRoute> routes = [
    MaterialPageRoute(builder: (context) => cours1("images/Langage C Nv1.png")),
    MaterialPageRoute(builder: (context) => cours2("images/Langage C Nv1.png")),
    MaterialPageRoute(builder: (context) => cours3("images/Langage C Nv1.png")),
    MaterialPageRoute(builder: (context) => cours4("images/Langage C Nv1.png")),
  ];

  List catNames = [
    "category",
    'classes',
    'Free course',
    'BookStore',
    'Live Course',
    'LeaderBoard',
  ];
  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7C7F),
    Color(0xFFCB84FB),
    Color(0xFF78E667),
  ];
  // dark mode

  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Icon(Icons.store, color: Colors.white, size: 30),
    Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];
  // List imgList = [
  //   'Flutter',
  //   'React Native',
  //   'Python',
  //   'C#',
  // ];
  List imgList = [
    'Langage C Nv1',
    'Langage C Nv2',
    'Langage C Nv3',
    'Langage C Nv4',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30,
                      color: Colors.white,
                    ),
                    // Icon(
                    //   Icons.logout_rounded,
                    //   size: 30,
                    //   color: Colors.white,
                    // ),
                    GestureDetector(
                      onTap: () {
                        logoutUser(context);
                      },
                      child: Icon(
                        Icons.logout_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Bonjour ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " Search here....",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColors[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: catIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          catNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "courses",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "see All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'cours${index + 1}');
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/${imgList[index]}.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              imgList[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Text(
                            //   "s5 Videos",
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.w500,
                            //     color: Colors.black.withOpacity(0.5),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Color(0xFF674AEF),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Exercice'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Quise'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_home_screen), label: 'ChatBot'),
        ],
        // onTap: (int index) {
        //   if (index == 3) {
        //     // Si l'index sélectionné est 3 (Account), naviguez vers la page de profil
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ProfilePage()),
        //     );
        //   }
        // }
        onTap: (int index) {
          if (index == 0) {
            // Naviguer vers la page d'accueil
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfilePage()),
            // );
          } else if (index == 1) {
            // Naviguer vers la page de quiz
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 2) {
            // Naviguer vers la page du chatbot
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => welcome()),
            );
          } else if (index == 3) {
            // Naviguer vers la page de profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatBot()),
            );
          }
        },
      ),
    );
  }

  ////////////////////////////////////////////
  ///
  ///
}
// Importez la page de connexion

Future<void> logoutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Afficher un message de succès à l'utilisateur
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous avez été déconnecté avec succès'),
        duration: Duration(seconds: 2), // Durée du message
        backgroundColor: Colors.green, // Couleur du message
      ),
    );
    // Redirection vers la page de connexion après la déconnexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              login()), // Remplacez LoginScreen() par le nom de votre écran de connexion
    );
  } catch (e) {
    // Gérer les erreurs éventuelles lors de la déconnexion
    print("Erreur lors de la déconnexion de l'utilisateur: $e");
    // Afficher une boîte de dialogue ou un message d'erreur si nécessaire
  }
}

Future<void> logoutUserr(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Afficher un message de succès à l'utilisateur
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous avez été déconnecté avec succès'),
        duration: Duration(seconds: 2), // Durée du message
        backgroundColor: Colors.green, // Couleur du message
      ),
    );
    // Redirection vers la page de connexion après la déconnexion
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              login()), // Remplacez LoginScreen() par le nom de votre écran de connexion
    );
  } catch (e) {
    // Gérer les erreurs éventuelles lors de la déconnexion
    print("Erreur lors de la déconnexion de l'utilisateur: $e");
    // Afficher une boîte de dialogue ou un message d'erreur si nécessaire
  }
}
