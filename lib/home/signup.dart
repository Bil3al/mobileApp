// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class signup extends StatelessWidget {
  /////////////////////////////////////////////////////////////////////////////////
  String username = "", Email = "", Password = "";
  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController passwordConfirmationcontroller =
      new TextEditingController();
  final TextEditingController mailcontroller = new TextEditingController();

// variable firebase :
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final FirebaseFirestore firestore = FirebaseFirestore.instance();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Créez un compte, c'est gratuit ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Username", controller: namecontroller),
                  inputFile(label: "Email", controller: mailcontroller),
                  inputFile(
                      label: "Password",
                      obscureText: true,
                      controller: passwordcontroller),
                  inputFile(
                      label: "Confirm Password ",
                      obscureText: true,
                      controller: passwordConfirmationcontroller),
                ],
              ),
              Container(
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
                  // onPressed: () async {
                  //   CollectionReference collRef =
                  //       FirebaseFirestore.instance.collection('utlisateur');
                  //   collRef.add({
                  //     'name': namecontroller.text.trim(),
                  //     'email': mailcontroller.text.trim(),
                  //     'password': passwordcontroller.text.trim(),
                  //   });
                  // },
                  onPressed: () async {
                    if (namecontroller.text.isNotEmpty &&
                        mailcontroller.text.isNotEmpty &&
                        passwordcontroller.text.isNotEmpty) {
                      try {
                        await FirebaseFirestore.instance
                            .collection('utilisateur')
                            .add({
                          'name': namecontroller.text.trim(),
                          'email': mailcontroller.text.trim(),
                          'password': passwordcontroller.text.trim(),
                        }).then((value) {
                          // Navigation vers la page Home après l'ajout des données
                          Navigator.pushNamed(context, 'Home');
                        });
                      } catch (e) {
                        print('Erreur lors de l\'ajout des données : $e');
                      }
                    } else {
                      print('Veuillez remplir tous les champs.');
                    }
                  },

                  color: Color(0xFF674AEF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Vous avez déjà un compte?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, 'login'); // Assuming you have a login screen
                    },
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
}
