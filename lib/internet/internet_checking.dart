import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/internet/no_internet_page.dart';
import 'package:zespeedo/provider/internet_provider.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {
  late BuildContext? dialogContext;

  @override
  Widget build(BuildContext context) {
    final connectivityService = Provider.of<ConnectivityService>(context);
    bool isConnected = connectivityService.isConnected;

    return StreamBuilder<ConnectivityResult>(
      stream: connectivityService.connectivityStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var newConnectionStatus = snapshot.data != ConnectivityResult.none;
          if (!isConnected && newConnectionStatus) {
            if (dialogContext != null) {
              Navigator.of(dialogContext!).pop();
              dialogContext = null;
            }
          } else if (isConnected && !newConnectionStatus) {
            showDialog(
              context: context,
              builder: (context) {
                dialogContext = context;
                return const AlertDialog(
                  title: Text('No Internet'),
                  content: Text('Please check your internet connection.'),
                );
              },
            );
          }

          isConnected = newConnectionStatus;
          return widget.child;
        } else {
          return const NoInternetPage();
        }
      },
    );
  }
}
