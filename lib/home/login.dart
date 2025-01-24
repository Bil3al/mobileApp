
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cours/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: unused_import
import 'package:cours/home/signup.dart';
// ignore: unused_import
import 'package:get/get.dart';

// ignore: must_be_immutable
class login extends StatelessWidget {
 


  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();



void loginUser(BuildContext context) {
  String username = usernamecontroller.text.trim();
  String password = passwordcontroller.text.trim();

  // Accéder à la collection "utilisateurs" dans Firestore
  FirebaseFirestore.instance.collection("utilisateur").get().then((snapshot) {
    bool found = false; // Indicateur pour vérifier si les identifiants sont valides

    snapshot.docs.forEach((document) {
      // Vérifier si le nom d'utilisateur et le mot de passe correspondent
      if (document.data()['name'] == username && document.data()['password'] == password) {
        found = true;
        // Arrêter la boucle si une correspondance valide est trouvée
        return;
      }
    });

    if (found) {
      // Les identifiants sont valides, naviguez vers la page home.dart
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      // Les identifiants sont invalides, affichez un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Nom d'utilisateur ou mot de passe incorrect",
          style: TextStyle(fontSize: 18.0),
        ),
      ));
    }
  }).catchError((error) {
    // Gérer les erreurs Firestore ici
    print("Erreur Firestore: $error");
  });
}













  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Connectez-vous à votre compte",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(
                          label: "username", controller: usernamecontroller),
                      inputFile(
                          label: "Password",
                          obscureText: true,
                          controller: passwordcontroller)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        //  Loginfct();
                        loginUser(context);
                      },
                      color: Color(0xFF674AEF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Se connecter",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text("Don't have an account?"),
                //     Text(
                //       " Sign up",
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w600,
                //           letterSpacing: 1,
                //           wordSpacing: 2,
                //           color: Color(0xFF674AEF)),
                //     )
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Vous n'avez pas de compte ?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context,
                            'signup'); // Use Navigator for navigation signup
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Color(0xFF674AEF),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/login.jpg"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile(
    {label, obscureText = false, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );

  // login fonction:

  // LoginAdmin() {
  //   FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
  //     snapshot.docs.forEach((result) {
  //       if(result.data()['id']!=usernamecontroller.text.trim()){

  //       }
  //     });
  //   });
  // }

  // ignore: dead_code
}
