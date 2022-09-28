import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:tuple/tuple.dart';

import 'callbacks_enum.dart';
import 'flutter_internet_speed_test_method_channel.dart';

typedef void CancelListening();
typedef void DoneCallback(double transferRate, SpeedUnit unit);
typedef void ProgressCallback(
  double percent,
  double transferRate,
  SpeedUnit unit,
);
typedef void ErrorCallback(String errorMessage, String speedTestError);

abstract class FlutterInternetSpeedTestPlatform extends PlatformInterface {
  /// Constructs a FlutterInternetSpeedTestPlatform.
  FlutterInternetSpeedTestPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterInternetSpeedTestPlatform _instance =
      MethodChannelFlutterInternetSpeedTest();

  /// The default instance of [FlutterInternetSpeedTestPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterInternetSpeedTest].
  static FlutterInternetSpeedTestPlatform get instance => _instance;

  Map<int, Tuple3<ErrorCallback, ProgressCallback, DoneCallback>>
      callbacksById = Map();
  int downloadRate = 0;
  int uploadRate = 0;
  int downloadSteps = 0;
  int uploadSteps = 0;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterInternetSpeedTestPlatform] when
  /// they register themselves.
  static set instance(FlutterInternetSpeedTestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<CancelListening> startDownloadTesting(
      {required DoneCallback onDone,
      required ProgressCallback onProgress,
      required ErrorCallback onError,
      required int fileSize,
      required String testServer}) {
    throw UnimplementedError(
        'startDownloadTesting() has not been implemented.');
  }

  Future<CancelListening> startUploadTesting({
    required DoneCallback onDone,
    required ProgressCallback onProgress,
    required ErrorCallback onError,
    required int fileSize,
    required String testServer,
  }) {
    throw UnimplementedError('startUploadTesting() has not been implemented.');
  }
}
