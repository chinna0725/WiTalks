import 'package:flutter/material.dart';

import '../../util/Polls.dart';

class PlayPartyGamesScreen extends StatefulWidget {
  final imageMap;

  const PlayPartyGamesScreen({super.key, required this.imageMap});

  @override
  State<PlayPartyGamesScreen> createState() => _PlayPartyGamesScreenState();
}

class _PlayPartyGamesScreenState extends State<PlayPartyGamesScreen> {
  int question_number = 0;
  late Map<String, dynamic> question;
  var points = 0;
  String? selected;
  bool getResult = false;
  late Map<String, dynamic> poll;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      question =
          widget.imageMap["Questions"][question_number] as Map<String, dynamic>;
      poll = question;
      selected = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var options = question["options"] as List<dynamic>;
    final totalQuestions = widget.imageMap["Questions"] as List<dynamic>;
    final totalQuestionsLenth = totalQuestions.length;
    int count = 0;
    final int days = DateTime(
      poll['end_date'].year,
      poll['end_date'].month,
      poll['end_date'].day,
    )
        .difference(DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        ))
        .inDays;
    bool hasVoted = poll['hasVoted'] ?? false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height * 0.90,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FlutterPolls(
                        pollId: poll['id'].toString(),
                        hasVoted: hasVoted,
                        userVotedOptionId: poll['userVotedOptionId'].toString(),
                        onVoted:
                            (PollOption pollOption, int newTotalVotes) async {
                          await Future.delayed(const Duration(seconds: 1));

                          /// If HTTP status is success, return true else false
                          return true;
                        },
                        pollEnded: days < 0,
                        pollTitle: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 18.0, top: 8),
                            child: Center(
                              child: Text(
                                poll['question'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        pollOptions: List<PollOption>.from(
                          poll['options'].map(
                            (option) => PollOption(
                              id: option['id'].toString(),
                              title: Text(
                                option['title'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              votes: option['votes'],
                            ),
                          ),
                        ),
                        votedPercentageTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        metaWidget: Row(
                          children: [
                            const SizedBox(width: 6),
                            const Text(
                              '•',
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              days < 0 ? "ended" : "ends in $days days",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0,top: 100),
                  child: TextButton(
                      onPressed: () {
                        if (question_number + 1 != totalQuestionsLenth) {
                          setState(() {
                            ++question_number;
                            getData();
                          });
                        } else {
                          print("Your points is $points");
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => ResultScreen(pionts:points),));
                          setState(() {
                            getResult = true;
                          });
                        }
                      },
                      child: const Text("Next")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
