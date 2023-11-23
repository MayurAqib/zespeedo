import 'package:flutter/material.dart';
import 'package:zespeedo/pages/help_support/help_support_page.dart';
import 'package:zespeedo/pages/home/home_page.dart';
import 'package:zespeedo/pages/privacy_policy/priivacy_policy.dart';
import 'package:zespeedo/pages/profile/profile_page.dart';
import 'package:zespeedo/pages/tab/google_navbar.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int selectedPageIndex = 0;
  setPageIndex(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  List pages = [
    const HomePage(),
    const PrivacyPolicy(),
    const HelpAndSupport(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[selectedPageIndex],
        bottomNavigationBar: GoogleNavbar(
            selectedIndex: selectedPageIndex,
            onTabChange: (selectedPageIndex) =>
                setPageIndex(selectedPageIndex)));
  }
}


// BottomNavigationBar(
//         landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedLabelStyle: GoogleFonts.roboto(
//             color: themeColor,
//             fontWeight: FontWeight.w900,
//             fontSize: 20,
//             height: 0),
//         unselectedLabelStyle: GoogleFonts.roboto(color: Colors.transparent),
//         useLegacyColorScheme: false,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.house,
//               color: selectedPageIndex == 0 ? themeColor : Colors.grey.shade600,
//               size: 25,
//             ),
//             label: '.',
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.productHunt,
//               color: selectedPageIndex == 1 ? themeColor : Colors.grey.shade600,
//               size: 25,
//             ),
//             label: '.',
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.message,
//               color: selectedPageIndex == 2 ? themeColor : Colors.grey.shade600,
//               size: 25,
//             ),
//             label: '.',
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(
//               FontAwesomeIcons.user,
//               color: selectedPageIndex == 3 ? themeColor : Colors.grey.shade600,
//               size: 25,
//             ),
//             label: '.',
//           ),
//         ],
//         currentIndex: selectedPageIndex,
//         onTap: setPageIndex,
//       )