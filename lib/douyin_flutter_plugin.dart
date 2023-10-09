
import 'douyin_flutter_plugin_platform_interface.dart';

class DouyinFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return DouyinFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
