import 'package:e_commerce_app/components/bottombar.dart';
import 'package:e_commerce_app/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

dynamic bgcolor = Colors.white;
dynamic fgcolor = Colors.deepOrange;
dynamic buttoncolor = Color.fromARGB(255, 100, 100, 100);
dynamic balance = 0.00;

class SettingRow extends StatelessWidget {
  final String iconPath;
  final String text;

  const SettingRow({super.key, required this.iconPath, required this.text});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          overlayColor: bgcolor,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        onPressed: () => showNotReadySnackBar(context),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Important: Don't expand full width
          children: [
            ImageIcon(AssetImage(iconPath), size: 30, color: Colors.black),
            SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.interTight(color: Colors.black, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

// class text extends Text
void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          leadingWidth: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Profile',
                style: GoogleFonts.interTight(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // leading: Container(
          //   // decoration: BoxDecoration(
          //   //   color:bgcolor,
          //   //   shape: BoxShape.circle,
          //   // ),
          //   margin: EdgeInsets.all(5),
          // ),
          // actions: [
          //   Container(
          //     decoration: BoxDecoration(color: bgcolor, shape: BoxShape.circle),
          //     margin: EdgeInsets.all(1),
          //     child: Row(),
          //   ),
          // ],
        ),

        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/user.png'),
                            size: 120,
                          ),
                          // Text(
                          //   'My.Name',
                          //   style: GoogleFonts.interTight(
                          //     fontSize: 30,
                          //     color: Colors.black
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            balance.toString(),
                            style: GoogleFonts.interTight(
                              fontSize: 60,
                              color: fgcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'My Balance',
                            style: GoogleFonts.interTight(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 50),

                  SettingRow(
                    iconPath: 'assets/icons/user.png',
                    text: 'My Orders',
                  ),
                  SettingRow(
                    iconPath: 'assets/icons/contrast.png',
                    text: 'Theme',
                  ),
                  SettingRow(
                    iconPath: 'assets/icons/messages.png',
                    text: 'Messages',
                  ),
                  SettingRow(
                    iconPath: 'assets/icons/language.png',
                    text: 'Language',
                  ),
                  SettingRow(
                    iconPath: 'assets/icons/settings.png',
                    text: 'settings',
                  ),
                  SettingRow(iconPath: 'assets/icons/info.png', text: 'About'),
                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomBar(currentPage: 'profile'),
      ),
    );
  }
}
            // DrawerRow(
            //   iconPath: 'assets/icons/user.png',
            //   settingText: 'Profile',
            // ),
            // DrawerRow(
            //   iconPath: 'assets/icons/messages.png',
            //   settingText: 'Messages',
            // ),
            // DrawerRow(
            //   iconPath: 'assets/icons/language.png',
            //   settingText: 'Language',
            // ),
            // DrawerRow(
            //   iconPath: 'assets/icons/contrast.png',
            //   settingText: 'Theme',
            // ),
            // DrawerRow(
            //   iconPath: 'assets/icons/settings.png',
            //   settingText: 'Settings',
            // ),
            // DrawerRow(iconPath: 'assets/icons/info.png', settingText: 'About'),