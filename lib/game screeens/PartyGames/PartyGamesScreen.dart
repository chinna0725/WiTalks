import 'package:flutter/material.dart';
import 'package:witalks/game%20screeens/PartyGames/PlayPartyGamesScreen.dart';

import '../../data/TemporaryData.dart';
import '../FunTestScreen/FunTestScreen.dart';


class PartyGamesScreen extends StatefulWidget {
  const PartyGamesScreen({super.key});

  @override
  State<PartyGamesScreen> createState() => _PartyGamesScreenState();
}

class _PartyGamesScreenState extends State<PartyGamesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade300,
        child: Column(
            children: TemporaryData.partyGames.map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:
                      (context) => PlayPartyGamesScreen(imageMap: item),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8),
                          left: Radius.circular(8),
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 15, bottom: 5),
                          child: Image.asset(item["ref image"].toString(),
                            height: 200,
                            width: double.maxFinite,
                            fit: BoxFit.cover,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:const Center(
                              child: Text("Try Quiz",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 14.0,top: 8),
                          child: Text(item["description"].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              )),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                              children:[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      "${k_m_b_generator(item["views"])} Views"
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                      "\u2022 ${k_m_b_generator(item["likes"])} Likes"
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "\u2022 ${k_m_b_generator(item["comments"])} Comments",
                                  ),
                                ),
                                Text(
                                  "\u2022 ${k_m_b_generator(item["shares"])} Shares",
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList()
        ),
      ),
    );
  }
}
