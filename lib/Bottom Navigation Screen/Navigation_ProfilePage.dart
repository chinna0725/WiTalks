import 'package:flutter/material.dart';
import 'package:witalks/LoginScreen.dart';

class NavigationProfilePage extends StatefulWidget {
  const NavigationProfilePage({super.key});
  @override
  State<NavigationProfilePage> createState() => _NavigationProfilePageState();
}

class _NavigationProfilePageState extends State<NavigationProfilePage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  const Scaffold(
        body: LoginScreen()

    ); //Scaffold
    // Remove debug banner for proper
    // view of setting icon//MaterialApp
  }
}