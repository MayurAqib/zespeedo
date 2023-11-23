import 'package:flutter/material.dart';

// class InternetCheckWrapper extends StatelessWidget {
//   final Widget child;

//   const InternetCheckWrapper({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ConnectivityService >(
//       builder: (context, internetProvider, child) {
//         return MaterialApp(
//           home: internetProvider.isInternetAvailable
//               ? child
//               : const NoInternetPage(),
//         );
//       },
//       child: child,
//     );
//   }
// }

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('No Internet Connection'),
      content:
          const Text('Please check your internet connection and try again.'),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('OK'),
        ),
      ],
    );
  }
}

// class InternetUtils {
//   static Future<bool> isInternetAvailable() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
// }
