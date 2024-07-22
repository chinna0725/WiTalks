import 'package:flutter/material.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/Navigation_FeedPage.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/Navigation_FramesPage.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/Navigation_ImagesPage.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/Navigation_ProfilePage.dart';
import 'package:witalks/Bottom%20Navigation%20Screen/Navigation_ReelsPage.dart';
import 'Bottom Navigation Screen/Navigation_HomePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
 // final _tabslist = ["TRENDING","NEW","QUIZ","FUN FILTER","BIRTHDAY WISHES","neon"] ;
  int _selectedTab = 0;
  final List _pages = [
    const NavigationHomePage(),
    const Navigation_FramesPage(),
    const Navigation_ReelsPage(),
    const Navigation_FeedPage(),
    const NavigationProfilePage()
  ];
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar:
      Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(25),
              left: Radius.circular(25)
            ),
            shape: BoxShape.rectangle
            // border: Border(
            //     top: BorderSide(color: Colors.black12, width: 1.0))
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: "Frames"),
            BottomNavigationBarItem(
                icon: Icon(Icons. video_camera_front_outlined), label: "Reels"),
            BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined), label: "Feed"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

// DefaultTabController(
// length: _tabslist.length,
// child: CustomScrollView(
// slivers: <Widget>[
// SliverAppBar(
// backgroundColor:  Colors.green,
// titleSpacing: 0,
// iconTheme: const IconThemeData(color: Colors.white),
// title: GestureDetector(
// onTap: () {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(content: Text("Clicked")));
// },
// child: const SizedBox(
// height: 40,
// child: TextField(
// textAlign: TextAlign.center,
// enabled: false,
// decoration: InputDecoration(
// contentPadding: EdgeInsets.only(left: 0,right: 55,top: 5,bottom: 5),
// filled: true,
// hintStyle: TextStyle(),
// hintText: "Search",
// prefixIcon: Icon(Icons.search),
// // contentPadding: ,
// fillColor: Colors.white,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.horizontal(
// right: Radius.circular(25),
// left: Radius.circular(25)))
// ),
// ),
// ),
// ),
// actions: const [
// Padding(
// padding: EdgeInsets.only(right: 8.0,left: 10),
// child: Icon(Icons.lan),
// )
// ],
// bottom: TabBar(
// isScrollable: true,
// indicatorColor: Colors.white,
// indicatorSize: TabBarIndicatorSize.tab,
// // controller: _tabController,
// tabs: _tabslist.map((tab) => Tab(text: tab)).toList(),
// ),
// ),
//
//
// ],
// ),
// ),
