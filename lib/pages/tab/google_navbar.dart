import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zespeedo/common/colors.dart';

class GoogleNavbar extends StatelessWidget {
  const GoogleNavbar({
    super.key,
    this.onTabChange,
    required this.selectedIndex,
  });
  final void Function(int)? onTabChange;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.white,
      tabBackgroundColor: Colors.white,
      onTabChange: onTabChange,
      selectedIndex: selectedIndex,
      activeColor: themeColor,
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      color: Colors.grey,
      tabs: [
        GButton(
          icon: FontAwesomeIcons.house,
          leading: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.house,
                color: selectedIndex == 0 ? themeColor : Colors.grey,
              ),
              if (selectedIndex == 0)
                const Text(
                  '.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: themeColor),
                )
            ],
          ),
        ),
        GButton(
          icon: FontAwesomeIcons.productHunt,
          leading: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.productHunt,
                color: selectedIndex == 1 ? themeColor : Colors.grey,
              ),
              if (selectedIndex == 1)
                const Text(
                  '.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: themeColor),
                )
            ],
          ),
        ),
        GButton(
          icon: FontAwesomeIcons.message,
          leading: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.message,
                color: selectedIndex == 2 ? themeColor : Colors.grey,
              ),
              if (selectedIndex == 2)
                const Text(
                  '.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: themeColor),
                )
            ],
          ),
        ),
        GButton(
          icon: FontAwesomeIcons.user,
          leading: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.user,
                color: selectedIndex == 3 ? themeColor : Colors.grey,
              ),
              if (selectedIndex == 3)
                const Text(
                  '.',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: themeColor),
                )
            ],
          ),
        ),
      ],
    );
  }
}
