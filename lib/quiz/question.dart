import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cours/quiz/service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Question extends StatefulWidget {
  //const Question({super.key});
  String category;
  Question({required this.category});

  State<Question> createState() => _Question();
}

class _Question extends State<Question> {
  bool show = false;

  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();
  Widget allQuiz() {
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  //   "images/background.png",
                                  ds["Image"],
                                  height: 270,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                show = true;
                                setState(() {});
                              },
                              child: show
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ds["correct"] == ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option1"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      /// ajouter ca
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF818181),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option1"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                show = true;
                                setState(() {});
                              },
                              child: show
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ds["correct"] == ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option2"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      /// ajouter ca
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF818181),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option2"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                show = true;
                                setState(() {});
                              },
                              child: show
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ds["correct"] == ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option3"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      /// ajouter ca
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF818181),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option3"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                show = true;
                                setState(() {});
                              },
                              child: show
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  ds["correct"] == ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option4"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),

                                      /// ajouter ca
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF818181),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        //    "Cristiano Ronaldo",
                                        ds["option4"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  show = false;
                                });
                                controller.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xFF004840),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004840),
      body: Container(
        //     margin: EdgeInsets.only(top: 40.0, left: 20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Color(0xFFf35b32),
                        borderRadius: BorderRadius.circular(60)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
