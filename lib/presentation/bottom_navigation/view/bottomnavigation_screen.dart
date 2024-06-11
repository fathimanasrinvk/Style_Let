import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:stylelet/core/constants/color.dart';

import '../controller/bottomnav_controller.dart';


class BottomnavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8),
        child: MoltenBottomNavigationBar(
          domeCircleColor:ColorTheme.secondarycolor,
          barColor: ColorTheme.white,
          selectedIndex:
          Provider.of<BottomNavController>(context).selectedIndex,
          onTabChange: Provider.of<BottomNavController>(context, listen: false)
              .onItemTap,

          tabs: [
            MoltenTab(
              icon: Icon(Icons.home,size: 33,),
            ),
            MoltenTab(
              icon: Icon(Icons.directions,size: 33,),
            ),
            MoltenTab(
              icon: Icon(Icons.calendar_month,size: 33,),
            ),MoltenTab(
              icon: Icon(Icons.settings,size: 33,),
            ),
          ],
        ),
      ),

    );
  }
}