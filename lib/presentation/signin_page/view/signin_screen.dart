import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylelet/presentation/bottom_navigation/view/bottomnavigation_screen.dart';
import '../../../firebase_functions.dart';
import '../../home_screen/view/home_screen.dart';
import '../../signup_page/view/signup_screen.dart';

class Signin_Screen extends StatefulWidget {
  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  final email_controller = TextEditingController();
  final pwd_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color(0xff0D454F),
              Color(0xE82E8A99),
              Color(0xff1E6571),
              Color(0xff0D454F),
              Color(0xE82E8A99),
              Color(0xff0D454F),
              Color(0xff1E6571),
              Color(0xff0D454F),
              Color(0xff1E6571),
              Color(0xE82E8A99),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "Welcome Back!!",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.blueGrey,
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: email_controller,
                                      decoration: const InputDecoration(
                                          hintText: "Enter Your Email ",
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: pwd_controller,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1500),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 160),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )),
                        const SizedBox(
                          height: 70,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: MaterialButton(
                              onPressed: () {
                                String email = email_controller.text.trim();
                                String password = pwd_controller.text.trim();
                                if (password.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              'Password must be at least 6 characters long')));
                                } else {
                                  FirebaseFunctions()
                                      .loginUser(
                                      email: email, pwd: password)
                                      .then((response) {
                                    if (response == null) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomnavScreen()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text(response)));
                                    }
                                  });
                                }
                              },
                              height: 50,
                              // margin: EdgeInsets.symmetric(horizontal: 50),
                              color: const Color(0xFF2E8A99),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: FadeInUp(
                                duration: const Duration(milliseconds: 1900),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Signup_Screen()));
                                    },
                                    child: RichText(
                                        text: TextSpan(children: [
                                          const TextSpan(
                                              text: " Don't have an account? ",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                          TextSpan(
                                            text: " Signup",
                                            style: GoogleFonts.gabriela(
                                                color: const Color(0xFF2E8A99),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          )
                                          // TextStyle(color: Color(0xFF1E5B5B),fontWeight: FontWeight.bold,fontSize: 15)),
                                        ])),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
