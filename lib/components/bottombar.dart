import 'package:e_commerce_app/cart.dart';
import 'package:e_commerce_app/favorite.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/profile.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String currentPage;
  const BottomBar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color.fromARGB(255, 255, 102, 0);
    Color unselectedColor = const Color.fromARGB(255, 120, 120, 120);

    return BottomAppBar(
      color: Colors.white,
      child: Builder(
        //Navigation.push can't be used without Builder because Navigator
        builder: (context) => Row(
          //operation requested with a context that does not include a Navigator
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const MainApp(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  size: 30,
                  color: currentPage == 'home'
                      ? selectedColor
                      : unselectedColor,
                ),
              ),
            ),
            SizedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const Favorite(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: ImageIcon(
                  AssetImage('assets/icons/heart.png'),
                  size: 30,
                  color: currentPage == 'favorites'
                      ? selectedColor
                      : unselectedColor,
                ),
              ),
            ),
            SizedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const Cart(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: ImageIcon(
                  AssetImage('assets/icons/shopping-cart.png'),
                  size: 30,
                  color: currentPage == 'cart'
                      ? selectedColor
                      : unselectedColor,
                ),
              ),
            ),
            SizedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const Profile(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                icon: ImageIcon(
                  AssetImage('assets/icons/user.png'),
                  size: 30,
                  color: currentPage == 'profile'
                      ? selectedColor
                      : unselectedColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
