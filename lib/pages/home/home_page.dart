import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/home/home_tabs/manufactures_tab/manufacturer_tab.dart';
import 'package:zespeedo/pages/home/home_tabs/product_tab/products_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const HeightGap(gap: 0.02),
            TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              indicatorPadding: const EdgeInsets.symmetric(vertical: -10),
              indicatorColor: themeColor,
              splashBorderRadius: BorderRadius.zero,
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelColor: themeColor,
              tabAlignment: TabAlignment.center,
              labelStyle: GoogleFonts.robotoSerif(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: GoogleFonts.robotoSerif(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: Colors.grey.shade600,
              tabs: const [
                Text('Products'),
                Text('Manufacturers'),
              ],
            ),
            const HeightGap(gap: 0.03),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
              child: SearchTextformField(
                controller: searchController,
                hintText: 'search',
                showPass: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
                      child: const FaIcon(FontAwesomeIcons.searchengin)),
                ),
              ),
            ),
            const HeightGap(gap: 0.05),
            const Expanded(
                child: TabBarView(children: [
              ProductsTab(),
              ManufacturerTab(),
            ]))
          ],
        ),
      ),
    );
  }
}
