import 'package:connectivity_plus/connectivity_plus.dart';

/// Helper class to check network connectivity
class ConnectivityHelper {
  final Connectivity _connectivity = Connectivity();

  /// Check if device has internet connection
  Future<bool> hasConnection() async {
    final result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  /// Stream of connectivity changes
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(
      (result) => !result.contains(ConnectivityResult.none),
    );
  }
}
