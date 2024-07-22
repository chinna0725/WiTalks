import 'package:flutter/material.dart';
import 'package:witalks/data/TemporaryData.dart';

import '../../util/Polls.dart';

class PollsScreen extends StatefulWidget {
  const PollsScreen({super.key});

  @override
  State<PollsScreen> createState() => _PollsScreenState();
}

class _PollsScreenState extends State<PollsScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        color: Colors.grey.shade300,
        child: ListView.builder(
          itemCount: TemporaryData.polls.length,
          itemBuilder: (BuildContext context, int index) {
            final Map<String, dynamic> poll = TemporaryData.polls[index];
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
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
               // margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: FlutterPolls(
                    pollId: poll['id'].toString(),
                    hasVoted: hasVoted,
                    userVotedOptionId:poll['userVotedOptionId'].toString(),
                    onVoted: (PollOption pollOption, int newTotalVotes) async {
                      await Future.delayed(const Duration(seconds: 1));
                      /// If HTTP status is success, return true else false
                      return true;
                    },
                    pollEnded: days < 0,
                    pollTitle: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          poll['question'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
                              fontWeight: FontWeight.w600,
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
            );
          },
        ),
      );
  }
}