import 'package:flutter/material.dart';
import 'package:music_app/consts/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beats",
        style: TextStyle(
          fontSize: 18,
          color: whiteColor,
          
        ),),
      ),
      body: Container(

      ),
    );
  }
}