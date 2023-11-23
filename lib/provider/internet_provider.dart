import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool _isConnected = true;

  bool get isConnected => _isConnected;

  Future<bool> checkConnection() async {
    var result = await _connectivity.checkConnectivity();
    bool newConnectionStatus = result != ConnectivityResult.none;

    if (newConnectionStatus != _isConnected) {
      _isConnected = newConnectionStatus;
      return _isConnected;
    } else {
      return false;
    }
  }

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged;
}
