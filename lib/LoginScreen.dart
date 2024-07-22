import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:witalks/util/LoginClipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool _condition = true;

  //GoogleSignInAccount? googleAccount;

   String? userName = "";
   String userEmail ="";
   String? userImage = "";

  Map<String, dynamic>? _userData;
 // AccessToken? _accessToken;
  bool _checking = true;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.green,
      ),
      child: SafeArea(
        child: Scaffold(
          body: loginWidget(size)
        ),
      ),
    );
  }

  Widget loginWidget(Size size){
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 200,
                width: size.width,
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Color(0xff00D64C),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom:50.0),
              child: Text("WiTalks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900
                  )
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        const Text("Create your profile",
          style: TextStyle(
              color: Color(0xff0C1C3D),
              fontSize: 20,
              fontWeight: FontWeight.w400
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0,left: 8,right: 8),
          child: Text("Create your profile to save the wonderful video\n for later",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff2B2A30),
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              )),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding:const EdgeInsets.symmetric( horizontal: 30.0),
          child: SizedBox(
            width: size.width,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                backgroundColor: const Color(0xffffffff),
                // padding: const EdgeInsetsDirectional.only(start: 100),
                shape: const RoundedRectangleBorder(
                    borderRadius:BorderRadius.all(Radius.circular(5))
                ),
              ),
              onPressed: () {
               // userFacebookLogin(context);
              },
              icon:  Image.asset("assets/facebook_logo.png",height: 30,width: 30),
              label: const Text("   Login with Facebook",
                  style: TextStyle(
                      color: Color(0xff0C1C3D)
                  )),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 30.0),
          child: SizedBox(
            width: size.width,
            child: ElevatedButton.icon(

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffffff),
                elevation:3,
                // padding: const EdgeInsetsDirectional.only(start: 100),
                shape: const RoundedRectangleBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(5))
                ),
              ),
              icon:  Image.asset("assets/google_logo.png",height: 25,width: 30,
              ),
              label: const Text("   Login with Google   ",
                style: TextStyle(
                    color: Color(0xff0C1C3D)
                ),),
              onPressed: () async {
                //userGoogleSignIn(context);
                // GoogleSignIn googleSignIn = GoogleSignIn(
                //   scopes: [
                //     'email',
                //   ],
                // );
                // final GoogleSignInAccount? googleAccount = await googleSignIn.signIn().then((value) {
                //   print("1111111111111111111111111 ${value!.displayName}");
                //
                // }).onError((error, stackTrace){
                //   print("error while google signin ------------------------------------${error}");
                // });
                // final GoogleSignInAuthentication googleAuthentication = await googleAccount!.authentication;
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(value: _condition,
              activeColor: const Color(0xff00D64C),
              onChanged: (value) {
                setState(() {
                  _condition=value!;
                });
              },),
            const Padding(
              padding: EdgeInsets.only(top: 14.0),
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                      children: [
                        TextSpan(text: "I agree to WiTalks "),
                        TextSpan(text: "terms of service",
                            style: TextStyle(
                                color:  Color(0xff00D64C),
                                decoration: TextDecoration.underline,
                                decorationColor:  Color(0xff00D64C)
                            )),
                        TextSpan(text: " and\n"),
                        TextSpan(text: "privacy policy",
                            style: TextStyle(
                                color: Color(0xff00D64C),
                                decoration: TextDecoration.underline,
                                decorationColor:  Color(0xff00D64C)
                            )),
                      ]
                  )
              ),
            )
          ],
        )
      ],
    );
  }

 Widget profileWidget(){
  return
   CustomScrollView(
     slivers: <Widget>[
       SliverAppBar(
         snap: false,
         pinned: true,
         floating: true,
         title: const Text("txt1"),
         // flexibleSpace: FlexibleSpaceBar(
         //
         // ),
         expandedHeight: 230,

         automaticallyImplyLeading: true,
         backgroundColor: Colors.greenAccent[400],
         leading: IconButton(
           icon: const Icon(Icons.menu),
           tooltip: 'Menu',
           onPressed: () {},
         ),
         actions: <Widget>[
           IconButton(
             icon: const Icon(Icons.comment),
             tooltip: 'Comment Icon',
             onPressed: () {},
           ),
           IconButton(
             icon: const Icon(Icons.settings),
             tooltip: 'Setting Icon',
             onPressed: () {},
           ),
         ],
         centerTitle: true,
       ),
       SliverList(
         delegate: SliverChildBuilderDelegate(
               (context, index) => ListTile(
             tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
             title: Center(
               child: Text('$index',
                   style: TextStyle(
                       fontWeight: FontWeight.normal,
                       fontSize: 50,
                       color: Colors.greenAccent[400])
               ),
             ),
           ),
           childCount: 51,
         ),
       ) //SliverList
     ], //<Widget>[]
   );
 }
  // Future<void> userGoogleSignIn(context) async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn(
  //       scopes: [
  //         'email',
  //       ],
  //     );
  //     if (kIsWeb || Platform.isAndroid ) {
  //       googleSignIn = GoogleSignIn(
  //         scopes: [
  //           'email',
  //         ],
  //       );
  //     }
  //     if (Platform.isIOS || Platform.isMacOS) {
  //       googleSignIn = GoogleSignIn(
  //         clientId:
  //         "YOUR_CLIENT_ID.apps.googleusercontent.com",
  //         scopes: [
  //           'email',
  //         ],
  //       );
  //     }
  //      googleAccount = await googleSignIn.signIn();
  //     if(googleAccount != null){
  //       final GoogleSignInAuthentication authentication = await googleAccount!.authentication;
  //       setState(() {
  //         userEmail = googleAccount!.email;
  //         userImage = googleAccount!.photoUrl;
  //         userName = googleAccount!.displayName;
  //       });
  //     }else{
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
  //       Text("account empty")));
  //     }
  //   } catch (error) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
  //     Text(error.toString())));
  //     print(error.toString());
  //   }
  // }
  //
  //
  // userFacebookLogin(context)async {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //
  //     if (result.status == LoginStatus.success) {
  //       _accessToken = result.accessToken;
  //       final userData = await FacebookAuth.instance.getUserData();
  //       _userData = userData;
  //       print("fb------------------------------${userData}");
  //     } else {
  //       print(result.status);
  //       print(result.message);
  //     }
  //     setState(() {
  //       _checking = false;
  //     });
  //   }
  //   _logout() async {
  //     await FacebookAuth.instance.logOut();
  //     // _accessToken = null;
  //     // _userData = null;
  //     setState(() {});
  //   }

}
//keytool -exportcert -alias androiddebugkey -keystore "C:\Users\perumal\.android\debug.keystore" | "C:\Users\perumal\Downloads\openssl-0.9.8k_X64\bin\openssl" sha1 -binary | "C:\Users\perumal\Downloads\openssl-0.9.8k_X64\bin\openssl" base64

