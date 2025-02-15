import 'package:flutter_internet_speed_test/src/extensions/string_extensions.dart';

enum TestType {
  download,
  upload;

  bool get isDownload => this == TestType.download;

  bool get isUpload => this == TestType.upload;

  @override
  String toString() {
    return name.capitalizeFirst();
  }
}

enum CallbacksEnum {
  startDownLoadTesting,
  startUploadTesting;

  bool get isStartDownLoadTesting => this == CallbacksEnum.startDownLoadTesting;

  bool get isStartUploadTesting => this == CallbacksEnum.startUploadTesting;
}

enum ListenerEnum {
  complete,
  error,
  progress,
  cancel;

  bool get isComplete => this == ListenerEnum.complete;

  bool get isError => this == ListenerEnum.error;

  bool get isProgress => this == ListenerEnum.progress;

  bool get isCancel => this == ListenerEnum.cancel;
}

enum SpeedUnit {
  kbps,
  mbps;

  bool get isKbps => this == SpeedUnit.kbps;

  bool get isMbps => this == SpeedUnit.mbps;

  @override
  String toString() {
    return name.capitalizeFirst();
  }
}
