import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget {
  final pionts;

  const ResultScreen({super.key, required this.pionts});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.height,
      width: size.width,
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height*0.60,
            width: size.width*0.90,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Your results",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text("Your Points ${widget.pionts}",
                  style: const TextStyle(
                    fontSize: 18,

                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
