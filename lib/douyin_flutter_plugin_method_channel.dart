import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'douyin_flutter_plugin_platform_interface.dart';

// 接口实现主要在channel文件中，该文件为interface的子类，负责具体接口的实现，但方法的具体实现依赖于调用原生端的实现。
class MethodChannelDouyinFlutterPlugin extends DouyinFlutterPluginPlatform {

  @visibleForTesting
  final methodChannel = const MethodChannel('douyin_flutter_plugin');

  // 在该文件中实现了该方法，在方法的实现为通过methodChannel调用的原生方法。
  @override
  Future<String?> getPlatformVersion() async {
    // 调用原生的方法
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
