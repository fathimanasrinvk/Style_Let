import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylelet/core/constants/color.dart';

import '../controller/homescreen_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8,top: 12),
          child: Row(
            children: [
              DropdownButton<String>(
                value: Provider.of<HomeController>(context).location,
                icon: Icon(Icons.arrow_drop_down,color: ColorTheme.secondarycolor,),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    Provider.of<HomeController>(context, listen: false)
                        .setLocation(newValue);
                  }
                },
                items: <String>['Kochi, Kerala', 'Chennai, Tamil Nadu', 'Mumbai, Maharashtra']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(color: ColorTheme.secondarycolor),),
                  );
                }).toList(),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.notifications, color: ColorTheme.secondarycolor),
                onPressed: () {
                  Provider.of<HomeController>(context, listen: false)
                      .onNotificationPressed();
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.filter_list, color: ColorTheme.secondarycolor),
                  onPressed: () {
                    Provider.of<HomeController>(context, listen: false)
                        .onFilterPressed();
                  },
                ),
              ),
              onChanged: (value) {
                Provider.of<HomeController>(context, listen: false)
                    .onSearch(value);
              },
            ),


          ],
        ),
      ),
    );
  }
}
