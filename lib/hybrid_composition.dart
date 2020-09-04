
import 'dart:async';

import 'package:flutter/services.dart';

class HybridComposition {
  static const MethodChannel _channel =
      const MethodChannel('hybrid_composition');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
