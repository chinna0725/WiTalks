import 'package:flutter/material.dart';
import 'package:witalks/game%20screeens/PersonalityQuiz/ResultScreen.dart';

import '../../data/TemporaryData.dart';

class PlayPersonalityQuizScreen extends StatefulWidget {
  final imageMap;

  const PlayPersonalityQuizScreen({super.key, required this.imageMap});

  @override
  State<PlayPersonalityQuizScreen> createState() =>
      _PlayPersonalityQuizScreenState();
}

class _PlayPersonalityQuizScreenState extends State<PlayPersonalityQuizScreen> {
  int question_number = 0;
  late Map<String, dynamic> question;
  var points=0;
  String? selected;
  bool getResult=false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      question = widget.imageMap["Questions"][question_number] as Map<String, dynamic>;
      selected="";
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var options = question["options"] as List<dynamic>;
     final totalQuestions= widget.imageMap["Questions"] as List<dynamic>;
    final totalQuestionsLenth= totalQuestions.length;
    int count = 0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          leading: IconButton(
            onPressed: () {
            Navigator.of(context).pop();
          },
            icon: const Icon(
            Icons.arrow_back
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        // key: listViewKey,
                        width: size.width * 0.90,
                        constraints: const BoxConstraints(
                          minHeight: 200,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: question["Image question"] != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    question["Image question"]
                                                        .toString()),
                                                fit: BoxFit.contain),
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                              right: Radius.circular(25),
                                              left: Radius.circular(25),
                                            )),
                                      ),
                                    )
                                  : const Visibility(
                                      visible: false, child: Text("")),
                            ),
                            question["Text question"] != null
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, top: 8, bottom: 8),
                                    child: Text(
                                      question["Text question"],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  )
                                : const Visibility(visible: false, child: Text("")),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                      ),
                      child:Center(child:Text("${question_number+1}/${totalQuestionsLenth}")),
                    ),
                  ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
            //Showing options ---------------------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: options.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            selected = item["opt"];
                            points += item["points"] as int;
                          });
                          if(question_number+1!=totalQuestionsLenth){
                            setState(() {
                              ++question_number;
                              getData();
                            });
                          }else{
                            print("Your points is $points");
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultScreen(pionts:points),));
                            setState(() {
                              getResult=true;
                            });
                          }
                        },
                        child: Container(
                          width: size.width * 0.90,
                          decoration:  BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(10),
                                left: Radius.circular(10),
                              ),
                              color: selected == item["opt"]?Colors.blue:Colors.white),
                          constraints: const BoxConstraints(minHeight: 50),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(10),
                                        left: Radius.circular(10),
                                      )),
                                  child: Center(
                                    child: Text(
                                      "${++count}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8.0, left: 3),
                                  child: Text(
                                    item["opt"],
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 14.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // question_number+1 == totalQuestionsLenth ?
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextButton(onPressed: () {
                //
                //     print("Your points is $points");
                //   },
                //       style: TextButton.styleFrom(
                //         backgroundColor: Colors.blue,
                //         shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.horizontal(
                //             left: Radius.circular(5),
                //             right: Radius.circular(5),
                //           )
                //         )
                //       ),
                //       child:
                //       const Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                //         child: Text("Get Result",style: TextStyle(
                //           color: Colors.white,
                //            fontWeight: FontWeight.w500,
                //           fontSize: 15
                //         )),
                //       )),
                // ):
                //     const Visibility(
                //       visible: false,
                //         child: Text("")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
