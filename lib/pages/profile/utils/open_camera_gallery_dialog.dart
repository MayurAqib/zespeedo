import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/provider/profile_provider.dart';

class OpenCameraGalleryDailog extends StatelessWidget {
  const OpenCameraGalleryDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.cancel, size: 30, color: themeColor),
              )
            ]),
            const SizedBox(height: 05),
            Text(
              'Choose your profile picture',
              style: GoogleFonts.robotoFlex(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Consumer<ProfileProvider>(
                builder: (context, value, child) => Row(
                      children: [
                        Expanded(
                            child: MyButton(
                                height: 50,
                                onTap: () {
                                  value.pickImageFromCamera(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.camera),
                                    const SizedBox(width: 3),
                                    Text(
                                      'Camera',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ))),
                        const SizedBox(width: 8),
                        Expanded(
                            child: MyButton(
                                height: 50,
                                onTap: () {
                                  value.pickImageFromGallery(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.file_copy),
                                    const SizedBox(width: 3),
                                    Text(
                                      'Gallery',
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ))),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
