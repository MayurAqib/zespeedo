class ApiConstants {
  static const baseUrl = 'https://panradix.com/Zspeedo.com/API/';
  static const emailRegister = 'RegisterEmail.php';
  static const phoneRegister = 'RegisterPhone.php';
  static const phoneLogin = 'LoginPhone.php';
  static const emailLogin = 'LoginEmail.php';
  static const userProfile = 'ShowProfile.php';
  static const editProfile = 'EditProfile.php';
}





  //  loadingBuilder: (BuildContext context,
  //                                         Widget child,
  //                                         ImageChunkEvent? loadingProgress) {
  //                                       if (loadingProgress == null) {
  //                                         return child; // Image is fully loaded, display the original child.
  //                                       } else {
  //                                         return Center(
  //                                           child: Shimmer.fromColors(
  //                                             baseColor: themeColor,
  //                                             highlightColor: Colors.white,
  //                                             child: CircularProgressIndicator(
  //                                               color: themeColor,
  //                                               value: loadingProgress
  //                                                           .expectedTotalBytes !=
  //                                                       null
  //                                                   ? loadingProgress
  //                                                           .cumulativeBytesLoaded /
  //                                                       (loadingProgress
  //                                                               .expectedTotalBytes ??
  //                                                           1)
  //                                                   : null,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       }
  //                                     }