import 'package:flutter/material.dart';


class TabBarItemAll extends StatefulWidget {
  const TabBarItemAll({super.key});
  @override
  State<TabBarItemAll> createState() => _TabBarItemAllState();
}

class _TabBarItemAllState extends State<TabBarItemAll> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 18.0,left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Personality Quiz's"),
            ],
          ),
        ),
      ],
    );
  }
}
