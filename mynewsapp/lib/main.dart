
import 'package:flutter/material.dart';
import 'package:mynewsapp/home_page.dart';
import 'package:mynewsapp/profile_page.dart';
import 'package:mynewsapp/search_page.dart';
import 'package:sizer/sizer.dart';
import 'favourites_page.dart';



void main() {
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyNewsApp(),
  ));
}

class MyNewsApp extends StatefulWidget {


  @override
  _MyNewsAppState createState() => _MyNewsAppState();
}

class _MyNewsAppState extends State<MyNewsApp> {

  @override
  Widget build(BuildContext context) {
return  Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
        body: Container(
          
          child: pages[currentIndex]),

        bottomNavigationBar: BottomNavigationBar(
          
          type: BottomNavigationBarType.fixed,
          
          currentIndex: currentIndex,
          onTap:(index)=> setState(()=>currentIndex = index,),

          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.home, ),
              label: "Home",

            ),

             BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.search,),
              label: "Search",
     
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person, ),
              label: "Profile",
              
              
            ),
          ],
        ),
        
      );

      }
 );

 
  
}

  int currentIndex=0;
  final pages=[
    Home(),
    Favourites(),
    Search(),
    Profile(),
  ];
}



