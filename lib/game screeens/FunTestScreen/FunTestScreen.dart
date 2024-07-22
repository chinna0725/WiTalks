import 'package:flutter/material.dart';
import 'package:witalks/data/TemporaryData.dart';
import 'package:witalks/game%20screeens/FunTestScreen/FunTestEditScreen.dart';



class FunTestScreen extends StatefulWidget {
  const FunTestScreen({super.key});

  @override
  State<FunTestScreen> createState() => _FunTestScreenState();
}

class _FunTestScreenState extends State<FunTestScreen> {

  Widget subIsThere (){
    return SizedBox(
      // color: Colors.blue,
      height: 70,
      width: double.infinity,
      child: Center(
        child: ListView(
          scrollDirection:Axis.horizontal,
          children: TemporaryData.funtest["sub category"]!.map((item) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration:const BoxDecoration(
                        shape:BoxShape.circle,
                        color:Colors.green
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                        maxWidth: 60,
                        minWidth: 40
                    ),
                    child: Center(
                      child: Text(item["title"].toString(),
                          overflow:TextOverflow.ellipsis,
                          maxLines:1,
                          style: const TextStyle(
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                  ),
                ],
              ),
            );
          }
          ).toList(),),
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: [
        if(TemporaryData.funtest["sub category"]!.isNotEmpty)  subIsThere(),
            Column(
              children:TemporaryData.funtest["posts"]!.map((item){
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:
                        (context) => FunTestEditScreen(imageMap: item),));
                  },
                  child:Padding(
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
                            padding:const EdgeInsets.only(right:8.0,left:8.0,top:8, bottom:5),
                            child:Image.asset(item["ref image"] as String,
                              height:180,
                              width:double.maxFinite,
                              fit:BoxFit.cover,),
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
                           child: Text(item["Question"] as String,
                           style: const TextStyle(
                             fontWeight: FontWeight.w500,
                           )),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Wrap(
                             children:[
                               Padding(
                                 padding:const EdgeInsets.only(left: 8.0),
                                 child: Text(
                                     "${k_m_b_generator(item["views"])} Views"
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Text(
                                     "${k_m_b_generator(item["likes"])} Likes"
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Text(
                                   "${k_m_b_generator(item["comments"])} Comments",
                                 ),
                               ),
                               Text(
                                 "${k_m_b_generator(item["shares"])} Shares",
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
          ],
        ),
      ),
    );
  }
}
// Widget randomImageType(context){
//   Map<dynamic,dynamic> a = TemporaryData.funtest[0];
//   List<Map<dynamic,dynamic>> b= a["random image"];
//   Map<dynamic,dynamic> item= b[0];
//   return GestureDetector(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(builder:
//       (context) => FunTestEditScreen(imageMap: item),));
//     },
//     child: Container(
//       decoration: const BoxDecoration(
//         color: Colors.white
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(item["ref image"],
//              height: 250,
//              width: double.maxFinite,
//             fit: BoxFit.cover,),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 20,right: 20),
//             child: Container(
//               height: 50,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child:const Center(
//                 child: Text("Try Quiz",style: TextStyle(
//                   color: Colors.white,
//                    fontSize: 20
//                 )),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
String k_m_b_generator(num) {
  if (num > 999 && num < 99999) {
    return "${(num / 1000).toStringAsFixed(1)} K";
  } else if (num > 99999 && num < 999999) {
    return "${(num / 1000).toStringAsFixed(0)} K";
  } else if (num > 999999 && num < 999999999) {
    return "${(num / 1000000).toStringAsFixed(1)} M";
  } else if (num > 999999999) {
    return "${(num / 1000000000).toStringAsFixed(1)} B";
  } else {
    return num.toString();
  }
}