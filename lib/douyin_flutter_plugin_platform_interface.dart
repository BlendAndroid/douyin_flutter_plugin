import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'douyin_flutter_plugin_method_channel.dart';

// 接口定义（主要定义方法，在channel中实现该方法，具体实现为原生实现对应的方法）
abstract class DouyinFlutterPluginPlatform extends PlatformInterface {

  // 构造函数
  DouyinFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  // 定义单例
  static DouyinFlutterPluginPlatform _instance = MethodChannelDouyinFlutterPlugin();

  static DouyinFlutterPluginPlatform get instance => _instance;

  static set instance(DouyinFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // 接口方法定义
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
