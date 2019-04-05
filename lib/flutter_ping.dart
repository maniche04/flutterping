import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter/services.dart';

class FlutterPing {
  static const MethodChannel _channel =
      const MethodChannel('flutter_ping');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> pingURL({@required String url}) async {
    final Map<String, dynamic> params = <String, dynamic> {
      'url': url,
    };
    final String result = await _channel.invokeMethod('pingURL', params);
    return result;
  }
}
