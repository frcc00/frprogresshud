import 'dart:async';

import 'package:flutter/services.dart';

class Frprogresshud {
  static const MethodChannel _channel =
      const MethodChannel('frprogresshud');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
