import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:cours/home/Home.dart';
import 'package:cours/quiz/admin/addquiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:get/get.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 110.0))),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 60.0,
              ),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      "Commençons avec Admin!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 5.0, bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 160, 160, 147)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: usernamecontroller,
                                  // ignore: body_might_complete_normally_nullable
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Entrer Username";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 160, 160, 147))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 5.0, bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 160, 160, 147)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  controller: passwordcontroller,
                                  // ignore: body_might_complete_normally_nullable
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Entrer Password";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 160, 160, 147))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                //   LoginAdmin();
                                FirebaseFirestore.instance
                                    .collection("admin")
                                    .get()
                                    .then((snapshot) {
                                  snapshot.docs.forEach((result) {
                                    if (result.data()['id'] !=
                                        usernamecontroller.text.trim()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "your id is not correct",
                                        style: TextStyle(fontSize: 18.0),
                                      )));
                                    } else if (result.data()['password'] !=
                                        passwordcontroller.text.trim()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "your password  is not correct",
                                        style: TextStyle(fontSize: 18.0),
                                      )));
                                    } else {
                                      Route route = MaterialPageRoute(
                                          builder: (context) => AddQuiz());
                                      Navigator.pushReplacement(context, route);
                                    }
                                  });
                                });
                                // FirebaseFirestore.instance
                                //     .collection("admin")
                                //     .where("id",
                                //         isEqualTo:
                                //             usernamecontroller.text.trim())
                                //     .get()
                                //     .then((value) {
                                //   if (value.docs.isNotEmpty) {
                                //     // Le document existe
                                //     var result = value.docs[0];
                                //     if (result.data()['password'] !=
                                //         passwordcontroller.text.trim()) {
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(SnackBar(
                                //         content: Text(
                                //           "Your password is not correct",
                                //           style: TextStyle(fontSize: 18.0),
                                //         ),
                                //       ));
                                //     } else {
                                //       Route route = MaterialPageRoute(
                                //           builder: (context) => AddQuiz());
                                //       Navigator.pushReplacement(context, route);
                                //     }
                                //   } else {
                                //     // Le document n'existe pas
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(SnackBar(
                                //       content: Text(
                                //         "Your ID is not correct",
                                //         style: TextStyle(fontSize: 18.0),
                                //       ),
                                //     ));
                                //   }
                                // });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Login ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // LoginAdmin() {
  //   FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
  //     snapshot.docs.forEach((result) {
  //       if (result.data()['id'] != usernamecontroller.text.trim()) {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: Text(
  //           "your id is not correct",
  //           style: TextStyle(fontSize: 18.0),
  //         )));
  //       } else if (result.data()['password'] !=
  //           passwordcontroller.text.trim()) {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: Text(
  //           "your password  is not correct",
  //           style: TextStyle(fontSize: 18.0),
  //         )));
  //       } else {
  //         Route route = MaterialPageRoute(builder: (context) => AddQuiz());
  //         Navigator.pushReplacement(context, route);
  //       }
  //     });
  //   });
  // }

  // void LoginAdmin() {
  //   FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
  //     bool found =
  //         false; // Indicateur pour vérifier si les identifiants sont valides

  //     snapshot.docs.forEach((result) {
  //       if (result.data()['id'] == usernamecontroller.text.trim() &&
  //           result.data()['password'] == passwordcontroller.text.trim()) {
  //         found = true;
  //         // Arrêter la boucle si une correspondance valide est trouvée
  //         return;
  //       }
  //     });

  //     if (found) {
  //       // Les identifiants sont valides, naviguez vers la page AddQuiz
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => AddQuiz()));
  //     } else {
  //       // Les identifiants sont invalides, affichez un message d'erreur
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //           "Your ID or password is incorrect",
  //           style: TextStyle(fontSize: 18.0),
  //         ),
  //       ));
  //     }
  //   }).catchError((error) {
  //     // Gérer les erreurs Firestore ici
  //     print("Firestore Error: $error");
  //   });
  // }
}
