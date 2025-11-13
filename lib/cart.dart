import 'package:e_commerce_app/components/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

dynamic bgcolor = Colors.white;
dynamic fgcolor = Colors.deepOrange;
dynamic buttoncolor = Color.fromARGB(255, 100, 100, 100);

// class text extends Text
void main() {
  runApp(Cart());
}

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgcolor,

        appBar: AppBar(
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          leadingWidth: 70,
          title: Text(
            'My Profile',
            style: GoogleFonts.interTight(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          leading: Container(
            // decoration: BoxDecoration(
            //   color:bgcolor,
            //   shape: BoxShape.circle,
            // ),
            margin: EdgeInsets.all(5),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
              margin: EdgeInsets.all(1),
              child: Row(),
            ),
          ],
        ),

        body: Container(
          margin: const EdgeInsets.only(left: 0, right: 0),
          child: ListView(
            children: [Padding(padding: const EdgeInsets.all(10))],
          ),
        ),

        bottomNavigationBar: BottomBar(currentPage: 'cart'),
      ),
    );
  }
}
