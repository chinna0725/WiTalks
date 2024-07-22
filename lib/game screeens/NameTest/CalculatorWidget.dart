import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  final imageMap;

  const CalculatorWidget({super.key, required this.imageMap});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width:size.width,
          height: size.height,
          color: Colors.white,
          child:   Column(
            children: [

              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text("Know your name Meaning",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey
                          )
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Enter Your First Name"
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0,left: 20,right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Colors.grey
                          )
                      ),
                      border: OutlineInputBorder(),
                      hintText:"Enter Your Second Name"
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Colors.green
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("Get Result",
                        style: TextStyle(
                            color: Colors.black
                        )),
                  ),
                  onPressed: () {


                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
