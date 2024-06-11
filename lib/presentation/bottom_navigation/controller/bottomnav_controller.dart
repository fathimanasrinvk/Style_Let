import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylelet/presentation/home_screen/view/home_screen.dart';


class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [
    HomeScreen(),
    Container(color: Colors.brown,),
    Container(color: Colors.deepOrange,),
    Container(color: Colors.yellow,),

  ];

}