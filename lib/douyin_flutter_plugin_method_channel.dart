import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'douyin_flutter_plugin_platform_interface.dart';

/// An implementation of [DouyinFlutterPluginPlatform] that uses method channels.
class MethodChannelDouyinFlutterPlugin extends DouyinFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('douyin_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
