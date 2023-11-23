import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/pages/home/home_tabs/product_tab/utils/product_tile.dart';
import 'package:zespeedo/pages/home/utils/heading.dart';

class ManufacturerTab extends StatelessWidget {
  const ManufacturerTab({super.key});

  @override
  Widget build(BuildContext context) {
    List colors = [
      Colors.orange,
      Colors.indigoAccent,
      Colors.indigo,
      Colors.red,
      themeColor
    ];
    List icons = [
      FontAwesomeIcons.accusoft,
      FontAwesomeIcons.fileShield,
      FontAwesomeIcons.padlet,
      FontAwesomeIcons.calendarXmark,
      FontAwesomeIcons.hackerrank,
    ];
    List text = [
      'All categories',
      'Zespeedo.com Membership',
      'Logistics services',
      'Ready to ship',
      'Special social picks',
    ];
    List topRankingCategory = [
      'Most popular',
      'Hot selling',
      'Most popular',
      'Hot selling',
      'Most popular',
    ];
    List newArrivalCategory = [
      'Last 60 days',
      'Eco friendly',
      'Social media',
      'Hot Trends',
      'Most popular',
    ];
    List trendingCategory = [
      'Tradional pakistani',
      'Popular',
      'Ready to ship',
    ];
    List topRankingImages = [
      'https://img.freepik.com/free-vector/cosmetics-3d-composition_1284-35838.jpg?ga=GA1.1.1867440536.1687323452&semt=ais',
      'https://img.freepik.com/free-vector/beauty-accessories-set_23-2147811431.jpg?ga=GA1.1.1867440536.1687323452&semt=ais',
      'https://img.freepik.com/free-vector/sunscreen-protection-cosmetics_1284-4094.jpg?ga=GA1.1.1867440536.1687323452&semt=ais',
      'https://img.freepik.com/free-vector/colored-cosmetic-template-composition-business-presentation-with-label-with-brand_1284-17379.jpg?ga=GA1.1.1867440536.1687323452&semt=ais',
      'https://img.freepik.com/free-vector/organic-cosmetics-set_1284-19247.jpg?ga=GA1.1.1867440536.1687323452&semt=ais',
    ];
    List newArrivalImages = [
      'https://img.freepik.com/free-photo/shirt-mockup-concept-with-plain-clothing_23-2149448749.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/free-photo/fashion-young-woman-black-stilish-dress_155003-9105.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/free-photo/pink-sweater-front_125540-746.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/premium-photo/beautiful-brunette-woman-stylish-floral-dress-holding-its-skirt-with-arm_132075-155.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/free-photo/young-indian-woman-wearing-sari_23-2149400839.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
    ];
    List trendingsImages = [
      'https://img.freepik.com/premium-photo/2-hot-asian-girl-landscape-standing-together-wearing-traditional-dresses-jewelry_658768-211.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/premium-photo/female-autumn-clothes-hangers-white-room_176873-13741.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/free-photo/clothes_144627-25214.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph'
    ];
    List justForYourImages = [
      'https://img.freepik.com/free-photo/ecstatic-white-girl-beret-posing-with-amazement-elegant-caucasian-female-model-t-shirt-standing-red-wall_197531-11462.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://i.pinimg.com/564x/c0/81/ac/c081ac65e85743468d873087154c34f3.jpg',
      'https://img.freepik.com/free-photo/young-woman-posing-with-black-glasses-red-background-high-quality-photo_114579-62333.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://i.pinimg.com/564x/08/c7/46/08c7469c2fe2c09b2866c4021927e6ba.jpg',
      'https://images.unsplash.com/photo-1524638431109-93d95c968f03?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fG1vZGVsfGVufDB8fDB8fHww',
      'https://images.unsplash.com/photo-1604681630513-69474a4e253f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fG1vZGVsfGVufDB8fDB8fHww',
      'https://img.freepik.com/free-photo/vertical-portrait-pretty-girl-with-long-curly-hair-red-lips-posing_197531-604.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bW9kZWx8ZW58MHx8MHx8fDA%3D',
      'https://img.freepik.com/free-photo/cute-brunette-white-sweater-city_1157-18467.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
      'https://img.freepik.com/free-photo/young-woman-portrait-street_1303-13672.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=sph',
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Heading(title: 'Ways to source manufacturers'),
          const HeightGap(gap: 0.01),
          SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin:
                            EdgeInsets.only(left: screenWidth(context) * 0.04),
                        width: screenWidth(context) * 0.42,
                        decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                text[index],
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                            FaIcon(icons[index], size: 35, color: Colors.white)
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20)
                ],
              )),
          const HeightGap(gap: 0.05),
          const Heading(title: 'Top manufacturers'),
          const HeightGap(gap: 0.01),
          SizedBox(
              height: screenHeight(context) * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                          heading: topRankingCategory[index],
                          images: topRankingImages[index],
                          desc: 'Self Defence Supplies For Personal Care');
                    },
                  ),
                  const SizedBox(width: 20)
                ],
              )),
          const HeightGap(gap: 0.05),
          const Heading(title: 'New arrivals'),
          const HeightGap(gap: 0.01),
          SizedBox(
              height: screenHeight(context) * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                          heading: newArrivalCategory[index],
                          images: newArrivalImages[index],
                          desc: 'Best Clothings Supplies For Any Event');
                    },
                  ),
                  const SizedBox(width: 20)
                ],
              )),
          const HeightGap(gap: 0.05),
          const Heading(title: 'Featured selections'),
          const HeightGap(gap: 0.01),
          SizedBox(
              height: screenHeight(context) * 0.24,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTile(
                        heading: trendingCategory[index],
                        images: trendingsImages[index],
                      );
                    },
                  ),
                  const SizedBox(width: 20)
                ],
              )),
          const HeightGap(gap: 0.05),
          const Heading(title: 'Just for you'),
          const HeightGap(gap: 0.01),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
            child: MasonryGridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(justForYourImages[index],
                              fit: BoxFit.fitWidth, loadingBuilder:
                                  (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: Shimmer.fromColors(
                                  baseColor: themeColor,
                                  highlightColor: Colors.white,
                                  child: CircularProgressIndicator(
                                    color: themeColor,
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                ),
                              );
                            }
                          }),
                        ),
                        const HeightGap(gap: 0.006),
                        Text(
                          'Original iPhone| 14 Pro Max',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const HeightGap(gap: 0.01),
                        Text(
                          'US\$24.75 - US\$48.51',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        const HeightGap(gap: 0.006),
                        Text(
                          '2 pieces left',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        const HeightGap(gap: 0.01),
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}


//!  https://i.pinimg.com/564x/21/1a/4c/211a4ceebb3578e46047ba222ce46a68.jpg