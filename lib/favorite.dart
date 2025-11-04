import 'package:e_commerce_app/components/bottombar.dart';
import 'package:e_commerce_app/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomBar(currentPage: 'favorites'),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.grey,
              margin: EdgeInsets.only(
                left: screenWidth * 0.2,
                right: screenWidth * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
