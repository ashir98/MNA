import 'package:flutter/material.dart';
class Favourites extends StatefulWidget {
  

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search"),),
      body: Container(child: Center(
        child: Text('Favourites'),
      ),),
    );
  }
}