import 'dart:async';

import 'package:flutter/services.dart';

class Frprogresshud {
  static const MethodChannel _channel =
      const MethodChannel('frprogresshud');

  static show(){
    _channel.invokeMethod('show');
  }

  static dismiss(){
    _channel.invokeMethod('dismiss');
  }
}
