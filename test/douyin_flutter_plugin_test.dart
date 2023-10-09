import 'package:flutter_test/flutter_test.dart';
import 'package:douyin_flutter_plugin/douyin_flutter_plugin.dart';
import 'package:douyin_flutter_plugin/douyin_flutter_plugin_platform_interface.dart';
import 'package:douyin_flutter_plugin/douyin_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDouyinFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements DouyinFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DouyinFlutterPluginPlatform initialPlatform = DouyinFlutterPluginPlatform.instance;

  test('$MethodChannelDouyinFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDouyinFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    DouyinFlutterPlugin douyinFlutterPlugin = DouyinFlutterPlugin();
    MockDouyinFlutterPluginPlatform fakePlatform = MockDouyinFlutterPluginPlatform();
    DouyinFlutterPluginPlatform.instance = fakePlatform;

    expect(await douyinFlutterPlugin.getPlatformVersion(), '42');
  });
}
