// ignore: unused_import
import 'package:cours/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdf6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF674AEF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cours  les Arbres'),
            SizedBox(width: 10),

            //  Icon(Icons.arrow_back_ios),
          ],
        ),
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
      body: SfPdfViewer.asset("images/arbre.pdf"),
    );
  }
}
