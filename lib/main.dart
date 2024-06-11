//
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:stylelet/homescreen.dart';
// import 'package:stylelet/signin_screen.dart';
// import 'package:stylelet/signup_screen.dart';
//
//
// void main() async{
//   await WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options:const FirebaseOptions(
//         apiKey:"AIzaSyBsknIbm1Qivnw2WJTbxPj80delFpLSx6w",
//         messagingSenderId: '',
//         projectId: "stylelet-30bd9",
//         storageBucket: "stylelet-30bd9.appspot.com",
//         appId: "1:198672040156:android:30485b212966cc9af93419",
//       )
//   );
//
//   User? user = FirebaseAuth.instance.currentUser;     //to fetch the user who logged in
//
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: user == null ?  Fire_Splash():Home_Screen(),
//   ));
// }
// class Fire_Splash extends StatefulWidget {
//   const Fire_Splash({super.key});
//
//   @override
//   State<Fire_Splash> createState() => _Fire_SplashState();
// }
//
// class _Fire_SplashState extends State<Fire_Splash> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 4), () {
//       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup_Screen()));
//     });
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//       color: Colors.blue,
//       ),
//     );
//   }
// }
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stylelet/presentation/home_screen/view/home_screen.dart';
// import 'package:stylelet/presentation/signin_page/view/signin_screen.dart';
// import 'package:stylelet/presentation/signup_page/view/signup_screen.dart';
// import 'firebase_functions.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options:const FirebaseOptions(
//         apiKey:"AIzaSyBsknIbm1Qivnw2WJTbxPj80delFpLSx6w",
//         messagingSenderId: '',
//         projectId: "stylelet-30bd9",
//         storageBucket: "stylelet-30bd9.appspot.com",
//         appId: "1:198672040156:android:30485b212966cc9af93419",
//       )
//
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Stylelet',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         textTheme: GoogleFonts.latoTextTheme(),
//       ),
//       home: Signin_Screen(),
//       routes: {
//         '/signin': (context) => Signin_Screen(),
//         '/signup': (context) => Signup_Screen(),
//         '/home': (context) => Home_Screen(),
//       },
//     );
//   }
// }
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylelet/presentation/bottom_navigation/controller/bottomnav_controller.dart';
import 'package:stylelet/presentation/bottom_navigation/view/bottomnavigation_screen.dart';
import 'package:stylelet/presentation/home_screen/controller/homescreen_controller.dart';
import 'package:stylelet/presentation/home_screen/view/home_screen.dart';
import 'package:stylelet/presentation/signin_page/view/signin_screen.dart';
import 'package:stylelet/presentation/signup_page/view/signup_screen.dart';
import 'package:stylelet/presentation/splash_screen/controller/splash_controller.dart';
import 'package:stylelet/presentation/splash_screen/view/splash_screen.dart';
import 'firebase_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBsknIbm1Qivnw2WJTbxPj80delFpLSx6w",
      messagingSenderId: '',
      projectId: "stylelet-30bd9",
      storageBucket: "stylelet-30bd9.appspot.com",
      appId: "1:198672040156:android:30485b212966cc9af93419",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: SplashPage(),
        routes: {
          '/signin': (context) => Signin_Screen(),
          '/signup': (context) => Signup_Screen(),
          '/home': (context) => BottomnavScreen(), // Change this to MainPage
        },
      ),
    );
  }
}
