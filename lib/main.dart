// ignore: unused_import
import 'dart:io';

import 'package:cours/LangageFolder/cours1.dart';
import 'package:cours/LangageFolder/cours2.dart';
import 'package:cours/LangageFolder/cours3.dart';
import 'package:cours/LangageFolder/cours4.dart';
import 'package:cours/courspdf/pdf1.dart';
import 'package:cours/courspdf/pdf2.dart';
import 'package:cours/courspdf/pdf3.dart';
import 'package:cours/courspdf/pdf4.dart';
import 'package:cours/courspdf/pdf5.dart';
import 'package:cours/courspdf/pdf6.dart';
import 'package:cours/courspdf/pdf7.dart';

// ignore: unused_import
import 'package:cours/firebase_options.dart';
import 'package:cours/home/Home.dart';
import 'package:cours/home/login.dart';
import 'package:cours/home/signup.dart';
import 'package:cours/pdfexercice/Correction1.dart';
import 'package:cours/pdfexercice/Correction2.dart';
import 'package:cours/pdfexercice/Correction3.dart';
import 'package:cours/pdfexercice/Correction4.dart';
import 'package:cours/pdfexercice/exercice1.dart';
import 'package:cours/pdfexercice/exercice2.dart';
import 'package:cours/pdfexercice/exercice3.dart';
import 'package:cours/pdfexercice/exercice4.dart';
import 'package:cours/quiz/admin/adminlogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home/welcome_screen.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: FirebaseOptions(
  //           apiKey: "AIzaSyCjmFhTR8rSuWgINCDgwmYejWsCXw98Iew",
  //           appId: "1:657713289305:android:47741e19b205020a76b948",
  //           messagingSenderId: "657713289305",
  //           projectId: "test2-2c89f.appspot.com",
  //         ),
  //       )
  //     : await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: welcome_screen(),
      routes: {
        'login': (context) =>
            login(), // Remplacez SignupScreen par votre widget de page
        'signup': (context) =>
            signup(), // Remplacez SignupScreen par votre widget de page signup
        'Exercice1': (context) => Exercice1(),
        'Correction1': (context) => Correction1(),
        ////////////////
        'Correction2': (context) => Correction2(),
        //////////////
        'Correction3': (context) => Correction3(),
        //////////////////////
        'Correction4': (context) => Correction4(),
        //////////////////
        'Exercice2': (context) => Exercice2(),
        ////////////////////////////////////////
        'Exercice3': (context) => Exercice3(),
        ///////////////////////////////
        'Exercice4': (context) => Exercice4(),
        /////////////////////////////
        'cours1': (context) => cours1("images/Langage C Nv1.png"),
        'cours2': (context) => cours2("images/Langage C Nv1.png"),
        'cours3': (context) => cours3("images/Langage C Nv1.png"),
        'cours4': (context) => cours4("images/Langage C Nv1.png"),

        // pour premier cours en cree cette chemin;
        'pdf1': (context) => pdf1(),
        'pdf2': (context) => pdf2(),
        'pdf3': (context) => pdf3(),
        'pdf4': (context) => pdf4(),
        'pdf5': (context) => pdf5(),
        'pdf6': (context) => pdf6(),
        'pdf7': (context) => pdf7(),
        // singup ==>home
        'Home': (context) => Home(),

        // choix ==> login user
       // 'login':(context) => login(),

        //choix ==> login admin

        'loginAdmin':(context) => AdminLogin(),
      },
    );
  }
}
