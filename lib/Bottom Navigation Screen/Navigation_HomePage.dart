import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/TabBarItem.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/TabBarItemAll.dart';
import 'package:witalks/game%20screeens/Contest/ContestScreen.dart';
import 'package:witalks/game%20screeens/FansQuiz/FansQuizScreen.dart';
import 'package:witalks/game%20screeens/FunTestScreen/FunTestScreen.dart';
import 'package:witalks/game%20screeens/NameTest/NameTestScreen.dart';
import 'package:witalks/game%20screeens/PartyGames/PartyGamesScreen.dart';
import 'package:witalks/game%20screeens/PersonalityQuiz/PersonalityQuizeScreen.dart';
import 'package:witalks/game%20screeens/Polls/PollsScreen.dart';
import 'package:witalks/game%20screeens/Riddle/RiddleScreen.dart';
import '../data/TemporaryData.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({super.key});
  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}
class _NavigationHomePageState extends State<NavigationHomePage> with TickerProviderStateMixin {
 late bool tab1;
  late bool tab2;
  late TabController _tabController;
  late TabController _tabController1;
  // Offset _offset = Offset.zero;
  // Offset _initialFocalPoint = Offset.zero;
  // Offset _sessionOffset = Offset.zero;
  // double _scale = 1.0;
  // double _initialScale = 1.0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
 ScrollController _scrollController = ScrollController();
  bool _notificationTogglevalue = true;
 bool _englishModeTogglevalue = false;
  @override
  void initState() {
    tab1 = false;
    tab2= true;
    _tabController= TabController(length: 1, vsync: this,initialIndex:0);
    _tabController1= TabController(length: TemporaryData.categoryList.length,
        vsync: this,initialIndex: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.green,
        statusBarBrightness: Brightness.dark,
      ),
      child:SafeArea(
        child: Scaffold(
          key: scaffoldKey,
         body: NestedScrollView(
           //controller: _scrollController,
           floatHeaderSlivers: true,
           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
           return[
             // SliverOverlapAbsorber(
             //     handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
             //   sliver: ,
             //
             //     ),
             SliverAppBar(
               pinned: false,
               floating: true,
               forceElevated: innerBoxIsScrolled,
               backgroundColor:Colors.green,
               titleSpacing:0,
               elevation: 0,
               iconTheme:const IconThemeData(color: Colors.white),
               title:const Text("WiTalks",
                   style: TextStyle(
                       color:Colors.white
                   )),
               leading: IconButton(
                 icon:const Icon(Icons.menu,), onPressed: () =>
                   scaffoldKey.currentState?.openDrawer(),
               ),
               actions: [
                 IconButton(onPressed: () {
                 },
                   icon:const Icon(Icons.search),),
                 Padding(
                   padding:const EdgeInsets.only(right: 8.0,left: 0),
                   child: Image.asset(
                       "assets/languageIcon.png",
                       width: 30,
                       height: 30),
                 )
               ],
             ),
             SliverPersistentHeader(
             pinned:true,
             delegate:PersistentHeader(
             widget:Padding(
             padding: const EdgeInsets.only(top: 1.0),
             child: Container(
               color: Colors.grey.shade300,
             width: size.width,
             child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Container(
             color: Colors.grey.shade300,
             width: size.width*0.15,
             height: 35,
             child: TabBar(
             onTap: (value) {
             setState(() {
             tab1=true;
             tab2=false;
             });
             },
             labelColor: tab1? Colors.black87:Colors.black54,
             unselectedLabelColor: Colors.black54,
             indicator: BoxDecoration(
             border: Border(
             bottom: tab1? const BorderSide(
             color: Colors.white,
             width: 0.0,
             ):
             const BorderSide(
             color:  Colors.transparent,
             width: 0.0,
             )
             ),
             ),
             controller: _tabController,
             indicatorSize: TabBarIndicatorSize.tab,
             labelPadding:  EdgeInsets.zero,
             // indicatorPadding:const EdgeInsets.only(left: 6,right: 8),
             tabs: [
             Tab(
             height: 65,
             child: Container(
             color: tab1? Colors.green.shade200:const Color(0XFFD9D9D9),
             height: 35,
             width: 60,
             //  color: Colors.black12,
             child: const Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             // Image.asset("assets/facebook_logo.png",
             //     height: 30,
             //     width: 30),
             Text("All",
             maxLines: 1,
             overflow:TextOverflow.ellipsis,
             style: TextStyle(
             overflow: TextOverflow.ellipsis,
             fontSize: 12
             ),
             softWrap: true),
             ],
             ),
             ),)
             ]),
             ),
             Container(
               color: Colors.grey.shade300,
             height:35,
             width: _tabController1.length <= 4?null: size.width*0.85,
             child: TabBar(
             // padding: EdgeInsets.all(5),
             onTap: (value) {
             setState(() {
             tab1 = false;
             tab2 = true;
             });
             },
             labelColor: tab2? Colors.black87:Colors.black54,
             unselectedLabelColor: Colors.black54,
             controller: _tabController1,
             isScrollable: true,
             tabAlignment: TabAlignment.start,
             indicatorPadding:const EdgeInsets.only(left: 5,right: 5,bottom: 0),
             labelPadding: const EdgeInsets.only(left: 0,bottom: 0),
             indicator: BoxDecoration(
             border: Border(
             bottom: tab2? const BorderSide(
             color:  Colors.transparent,
             width: 0.0,
             ):const BorderSide(
             color:  Colors.transparent,
             width: 0.0,
             )
             ),
             ),
             indicatorSize: TabBarIndicatorSize.tab,
             tabs:TemporaryData.categoryList.map((tab) => Tab(
             height: 35,
             child: Container(
             height: 35,
             //width: 75,
             color:
             TemporaryData.categoryList[_tabController1.index] == tab ?
             (tab2? Colors.green.shade200:const Color(0XFFD9D9D9)): const Color(0XFFD9D9D9),
             child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             // Padding(
             //   padding: const EdgeInsets.only(top: 8.0),
             //   child: Image.asset("assets/facebook_logo.png",
             //   height: 30,
             //   width: 30),
             // ),
             Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Text(tab,
             maxLines: 1,
             overflow:TextOverflow.ellipsis,
             style: const TextStyle(
             fontSize: 12,
             ),
             softWrap: true),
             ),
             ],
             ),
             )
             )).toList(),
             ),
             ),
             ],
             ),
             ),
             ),
             ),
             )
           ];
           },
           body:tab2 == true?
           TabBarView(
             controller: _tabController1,
             physics: const NeverScrollableScrollPhysics(),
             children: TemporaryData.categoryList.map((tap) {
               //  var d=TemporaryData.subCategory[tap]!["SubCategory"];
               switch(tap){
                 case "Personality Quiz":return const PersonalityQuizeScreen();break;
                 case "Polls":return const PollsScreen();
                 case "Fun Test":return const FunTestScreen();
                 case "Name test":return const FunTestScreen();
                 case "Riddle":return const RiddleScreen();
                 case "Fans Quiz":return const FansQuizScreen();
                 case "party games":return const PartyGamesScreen();
                 case "Contest":return const ContestScreen();
                 case "Gk":return const ContestScreen();
                 default :{
                   return const FunTestScreen();
                 }
               }
               // return tap == "Personality Quiz"?
               //  const PersonalityQuizeScreen(): tap=="Polls"?const PollsScreen():
               //     tap=="Fun Test"?const FunTestScreen():
               //         tap=="Name test"?const NameTestScreen():
               //             tap=="Riddle"?const RiddleScreen():
               //                 tap== "Fans Quiz"?const FansQuizScreen():
               //                     tap== "party games"?const PartyGamesScreen():
               //
               // Container(
               //     height: size.height,
               //     width: size.width,
               //     color: Colors.green,
               //     child: TabBarItem(
               //       tab: tap,));
               //   Container(
               //   height: size.height,
               //   width: size.width,
               //    //color: Colors.grey,
               //   child: Column(
               //     children: [
               //       SizedBox(
               //         height: 200,
               //         width: size.width,
               //         child: ListView.builder(
               //           scrollDirection: Axis.horizontal,
               //           itemCount: d.length,
               //           itemBuilder:(context, index) {
               //             var item = d[index];
               //
               //             return GestureDetector(
               //               onTap:() {
               //               }, // choose image on click of profile
               //               child: Padding(
               //                 padding: const EdgeInsets.all(8.0),
               //                 child: Column(
               //                   children: [
               //                     Container(
               //                       width: 60,
               //                       height: 60,
               //                       decoration: BoxDecoration(
               //                           shape: BoxShape.circle,
               //                           image: DecorationImage(
               //                               image: NetworkImage(item["image"]!), // picked file
               //                               fit: BoxFit.fill)),
               //                     ),
               //                     Text(item["title"]!,
               //                         style:const TextStyle(
               //                             fontSize: 10
               //                         )),
               //                   ],
               //                 ),
               //               ),
               //             );
               //           }, ),
               //       ),
               //
               //       //Image.network("https://www.gifimages.pics/images/quotes/english/general/good-night-gif-animation-download-52650-177940.gif"),
               //       // SizedBox(
               //       //   height: 400,
               //       //   child: GridView.builder(
               //       //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               //       //       crossAxisCount: 2,
               //       //     ),
               //       //     itemBuilder: (context, index) {
               //       //       var item= d[index];
               //       //       return Container(
               //       //         width: 100,
               //       //         color: Colors.green,
               //       //         height: 100,
               //       //         //  child: ,
               //       //       );
               //       //     },),
               //       // )
               //     ],
               //   ),
               // );

               //     Column(
               //     mainAxisAlignment: MainAxisAlignment.center,
               //     children: [
               //       WidgetMask(
               //         blendMode: BlendMode.dstOver,
               //         childSaveLayer: true,
               //         mask:
               //         GestureDetector(
               //           onScaleStart: (details) {
               //             _initialFocalPoint = details.focalPoint;
               //             _initialScale = _scale;
               //           },
               //           onScaleUpdate: (details) {
               //             setState(() {
               //               _sessionOffset = details.focalPoint - _initialFocalPoint;
               //               _scale = _initialScale * details.scale;
               //             });
               //           },
               //           onScaleEnd: (details) {
               //             setState(() {
               //               _offset += _sessionOffset;
               //               _sessionOffset = Offset.zero;
               //             });
               //           },
               //           child: Transform.translate(
               //             offset: _offset + _sessionOffset,
               //             child: Transform.scale(
               //               scale: _scale,
               //               child: Image.asset("assets/demo1.jpeg",
               //               ),
               //             ),
               //           ),
               //         ),
               //         child: Image.asset("assets/testing1.png",
               //         ),
               //       ),
               //       Image.asset("assets/testing1.png",
               //           height: 300,
               //           width: 350,
               //       ),
               //        Text(tap)
               // // Center(
               // // child: Stack(
               // // alignment: Alignment.center,
               // // children: [
               // // // Background image with transparent part
               // // Image.asset('assets/demo1.jpeg'),
               // //
               // // // Image to be placed inside the transparent part
               // // ColorFiltered(
               // // colorFilter: const ColorFilter.mode(
               // // Colors.transparent, // You can change the color as needed
               // // BlendMode.saturation,
               // // ),
               // // child: Image.asset('assets/facebook_logo.jpg'),
               // // ),
               // // ],
               // // ),
               // // )
               //     ],
               //   );
             }).toList(),
           ):
           SizedBox(
             height: size.height,
             child: TabBarView(
                 controller: _tabController,
                 physics: const NeverScrollableScrollPhysics(),
                 children:const [
                   TabBarItemAll()
                 ]
             ),
           ),
         ),
          drawer: Drawer(
              elevation: 1.5,
              child: Column(children: <Widget>[
                withoutUserLoginDrawer(),
                const Padding(
                  padding: EdgeInsets.only(right: 5.0,left: 5,top: 8),
                  child: Divider(
                   // color: Colors.green,
                    height: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        ListTile(
                          title: const Text('Notifications'),
                          trailing:Transform.scale(
                                            scale: 0.45,
                                            child: Switch(
                                              // thumb color (round icon)
                                              activeColor: Colors.green,
                                              activeTrackColor: Colors.green.shade100,
                                              inactiveThumbColor: Colors.blueGrey.shade600,
                                              inactiveTrackColor: Colors.grey.shade300,
                                             // splashRadius: 50.0,
                                              // boolean variable value
                                              value: _notificationTogglevalue,
                                              // changes the state of the switch
                                              onChanged: (value) => setState(() => _notificationTogglevalue = value),
                                            ),
                                          ),
                          leading: const Icon(Icons.notifications,color: Colors.amber),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Language'),
                              Text('Language',style: TextStyle(
                                fontSize: 8
                              ),)
                            ],
                          ),
                          leading: const Icon(Icons.language,color: Colors.blue),
                          onTap: () {},
                        ),
                        ListTile(
                            title: const Text('Daily status'),
                            leading: const Icon(Icons.image,color: Colors.green,),
                            onTap: () {}),
                        ListTile(
                          title: const Text('Rate us'),
                          leading: const Icon(Icons.star,color: Colors.red,),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('How to use WiTalks'),
                          leading: const Icon(Icons.book_online_rounded,color: Colors.blue),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Contact us'),
                          leading: const Icon(Icons.sms,color: Colors.amber),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Privacy Policy'),
                          leading: const Icon(Icons.privacy_tip,color:Colors.red),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Boost'),
                          leading: const Icon(Icons.delete,color: Colors.cyan,),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Text('Settings'),
                          leading: const Icon(Icons.settings,color: Colors.red,),
                          onTap: () {},
                        ),
                        ListTile(
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('English mode'),
                              Text("Only the app language will be in english",
                                style: TextStyle(
                                fontSize: 8
                              ),)
                            ],
                          ),
                          trailing:Transform.scale(
                            scale: 0.45,
                            child: Switch(
                              // thumb color (round icon)
                              activeColor: Colors.green,
                              activeTrackColor: Colors.green.shade100,
                              inactiveThumbColor: Colors.blueGrey.shade600,
                              inactiveTrackColor: Colors.grey.shade300,
                              // splashRadius: 50.0,
                              // boolean variable value
                              value: _englishModeTogglevalue,
                              onChanged: (value) => setState(() => _englishModeTogglevalue = value),
                            ),
                          ),
                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              shape: BoxShape.rectangle
                            ),
                            child: const Center(
                              child: Text(
                                "A",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    )),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                  endIndent: 5,
                  indent: 5,
                ),
                // Container(
                //   color: Colors.black,
                //   width: double.infinity,
                //   height: 0.1,
                // ),
                Container(
                    padding: const EdgeInsets.all(5),
                    height: 100,
                    child: Column(
                      children: [
                        const Expanded(
                          flex: 1,
                            child: Text("Follow Us")),
                        const SizedBox(height: 5,),
                        Expanded(
                          flex: 1,
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Image.asset("assets/facebook_logo.png",height: 25,width: 30,),
                              Image.asset("assets/google_logo.png",height: 25,width: 30,),
                              Image.asset("assets/google_logo.png",height: 25,width: 30,),
                              Image.asset("assets/google_logo.png",height: 25,width: 30,),
                            ],
                          ),
                        ),
                       const SizedBox(
                          height: 20,
                        ),
                        const Text("V1.0.0",style: TextStyle(fontWeight: FontWeight.w300,
                        color: Colors.grey),),
                      ],
                    )),
              ])),
        ),
      ),
    );
  }
}
//drawer for before user login
Widget withoutUserLoginDrawer(){
  return SizedBox(
    height: 110,
    // color: Colors.grey,
    // width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.person_2_outlined,
                color: Colors.white),
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Create your profile",
                  textWidthBasis: TextWidthBasis.parent,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Create your profile to save the\n"
                    "    wonderful photo for later",
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                        right: Radius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Your onPressed logic here
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
//drawer for after user login
Widget withUserLoginDrawer(){
  return SizedBox(
    height: 70,
    // color: Colors.grey,
    // width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(top: 15.0,left: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.person_2_outlined,
                color: Colors.white),
          ),
          const SizedBox(
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("Create your profile",
                    textWidthBasis: TextWidthBasis.parent,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0,top: 5),
                  child: Text("update your profile",
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 11,
                    ),),
                ),
              ],
            ),
          ),
          const Icon(Icons.navigate_next_outlined,size: 60,color: Colors.grey,)
        ],
      ),
    ),
  );
}

class PersistentHeader extends SliverPersistentHeaderDelegate{
  final Widget widget;
  PersistentHeader({required this.widget});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        width: double.infinity,
        height: 35.0,
        color: Colors.grey.shade300,
        child: widget);
  }
  @override
  // TODO: implement maxExtent
  double get maxExtent => 35.0;
  @override
  // TODO: implement minExtent
  double get minExtent => 35.0;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
class ZoomAndPanDemo extends StatefulWidget {
  const ZoomAndPanDemo({super.key});
  @override
  _ZoomAndPanDemoState createState() => _ZoomAndPanDemoState();
}

class _ZoomAndPanDemoState extends State<ZoomAndPanDemo> {
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _sessionOffset = Offset.zero;
  double _scale = 1.0;
  double _initialScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _initialFocalPoint = details.focalPoint;
        _initialScale = _scale;
      },
      onScaleUpdate: (details) {
        setState(() {
          _sessionOffset = details.focalPoint - _initialFocalPoint;
          _scale = _initialScale * details.scale;
        });
      },
      onScaleEnd: (details) {
        setState(() {
          _offset += _sessionOffset;
          _sessionOffset = Offset.zero;
        });
      },

      child: Transform.translate(
        offset: _offset + _sessionOffset,
        child: Transform.scale(
          scale: _scale,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}