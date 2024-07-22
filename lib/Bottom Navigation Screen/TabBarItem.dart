import 'package:flutter/material.dart';
import 'package:witalks/EditingScreen.dart';
import '../data/TemporaryData.dart';
import 'package:widget_mask/widget_mask.dart';

class TabBarItem extends StatefulWidget {
 //final List<dynamic> tabItem;
 final String tab;
  const TabBarItem({super.key, required this.tab});
  @override
  State<TabBarItem> createState() => _TabBarItemState();
}
class _TabBarItemState extends State<TabBarItem> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SizedBox(
      height: 400,
      child: ListView.builder(
       // physics: NeverScrollableScrollPhysics(),
        itemCount: 30,
        itemBuilder: (context, index) {
       return Center(
         child: Text('$index',
             style: TextStyle(
                 fontWeight: FontWeight.normal,
                 fontSize: 50,
                 color: Colors.greenAccent[400])
         ),
       );
      },),
    );
  }
}

//sub categories
// Container(
//   height: 100,
//     width: size.width,
//      color: Colors.grey,
//   child:ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: widget.tabItem.length,
//     itemBuilder:(context, index) {
//       var item = widget.tabItem[index];
//       return GestureDetector(
//         onTap:() {
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                         image: NetworkImage(
//                             item["image"]!), // picked file
//                         fit: BoxFit.fill)),
//               ),
//               Text(item["title"]!,
//                   style:const TextStyle(
//                       fontSize: 10
//                   )),
//             ],
//           ),
//         ),
//       );
//     }, ),
// ),