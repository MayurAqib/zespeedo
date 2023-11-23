import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key, this.heading = '', required this.images, this.desc = ''});
  final String? heading;
  final String images;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(left: screenWidth(context) * 0.04),
        width: screenWidth(context) * 0.42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            heading!,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Container(
              height: screenHeight(context) * 0.17,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(images, fit: BoxFit.cover, loadingBuilder:
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
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                }
              })),
          Text(
            desc!,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(height: 0, fontWeight: FontWeight.w600),
          )
        ]));
  }
}
